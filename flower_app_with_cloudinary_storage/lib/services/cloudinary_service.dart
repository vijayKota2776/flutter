import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'cloudinary_config.dart';

class CloudinaryService {
  static Future<String> upload({
    File? file,
    Uint8List? bytes,
    String? name,
    String type = 'auto',
  }) async {
    if (file == null && bytes == null) return '';

    final req = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/$type/upload'),
    )..fields['upload_preset'] = CloudinaryConfig.uploadPreset;

    if (bytes != null) {
      req.files.add(http.MultipartFile.fromBytes('file', bytes, filename: name));
    } else if (file != null) {
      req.files.add(await http.MultipartFile.fromPath('file', file.path, filename: name));
    }

    final res = await http.Response.fromStream(await req.send());
    return jsonDecode(res.body)['secure_url'] ?? '';
  }

  static Future<void> delete(String url) async {
    if (!url.contains('cloudinary.com')) return;
    try {
      final isRaw = url.contains('/raw/upload/');
      final resourceType = isRaw ? 'raw' : 'image';

      final segments = url.split('/upload/').last.split('/');
      if (segments.isNotEmpty && RegExp(r'^v\d+$').hasMatch(segments.first)) {
        segments.removeAt(0);
      }
      final rawPath = segments.join('/');
      final publicId = isRaw ? rawPath : rawPath.replaceFirst(RegExp(r'\.[^.]+$'), '');

      final time = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final sign = sha1
          .convert(utf8.encode('public_id=$publicId&timestamp=$time${CloudinaryConfig.apiSecret}'))
          .toString();

      final res = await http.post(
        Uri.parse('https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/$resourceType/destroy'),
        body: {'public_id': publicId, 'timestamp': '$time', 'api_key': CloudinaryConfig.apiKey, 'signature': sign},
      );

      final data = jsonDecode(res.body);
      if (data['result'] != 'ok') {
        final altType = isRaw ? 'image' : 'raw';
        final altId = altType == 'image' ? rawPath.replaceFirst(RegExp(r'\.[^.]+$'), '') : rawPath;
        final altSign = sha1
            .convert(utf8.encode('public_id=$altId&timestamp=$time${CloudinaryConfig.apiSecret}'))
            .toString();
        await http.post(
          Uri.parse('https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/$altType/destroy'),
          body: {'public_id': altId, 'timestamp': '$time', 'api_key': CloudinaryConfig.apiKey, 'signature': altSign},
        );
      }
    } catch (_) {}
  }
}
