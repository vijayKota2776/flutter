import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/flower_model.dart';
import 'cloudinary_service.dart';

class FirebaseService {
  final _db = FirebaseFirestore.instance.collection('flowers');

  Stream<List<Flower>> getFlowersStream() =>
      _db.orderBy('createdAt', descending: true).snapshots().map((s) => s.docs.map(Flower.fromFirestore).toList());

  Future<void> addFlower({
    required String name,
    required String description,
    File? imageFile,
    Uint8List? imageBytes,
    String? imageFileName,
    File? pdfFile,
    Uint8List? pdfBytes,
    String? pdfFileName,
  }) async {
    final imageUrl = await CloudinaryService.upload(file: imageFile, bytes: imageBytes, name: imageFileName, type: 'image');
    final pdfUrl = await CloudinaryService.upload(file: pdfFile, bytes: pdfBytes, name: pdfFileName, type: 'raw');

    await _db.add({
      'name': name.trim(),
      'description': description.trim(),
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
      'pdfFileName': pdfFileName ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateFlower({
    required String id,
    required String name,
    required String description,
    File? newImageFile,
    Uint8List? newImageBytes,
    String? newImageFileName,
    String? existingImageUrl,
    File? newPdfFile,
    Uint8List? newPdfBytes,
    String? newPdfFileName,
    String? existingPdfUrl,
    String? existingPdfFileName,
  }) async {
    String imageUrl = existingImageUrl ?? '';
    String pdfUrl = existingPdfUrl ?? '';
    String pdfFileName = existingPdfFileName ?? '';

    if (newImageFile != null || newImageBytes != null) {
      if (existingImageUrl != null) await CloudinaryService.delete(existingImageUrl);
      imageUrl = await CloudinaryService.upload(file: newImageFile, bytes: newImageBytes, name: newImageFileName, type: 'image');
    }

    if (newPdfFile != null || newPdfBytes != null) {
      if (existingPdfUrl != null) await CloudinaryService.delete(existingPdfUrl);
      pdfUrl = await CloudinaryService.upload(file: newPdfFile, bytes: newPdfBytes, name: newPdfFileName, type: 'raw');
      pdfFileName = newPdfFileName ?? 'document.pdf';
    }

    await _db.doc(id).update({
      'name': name.trim(),
      'description': description.trim(),
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
      'pdfFileName': pdfFileName,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteFlower(Flower flower) async {
    await _db.doc(flower.id).delete();
    if (flower.imageUrl.isNotEmpty) await CloudinaryService.delete(flower.imageUrl);
    if (flower.pdfUrl.isNotEmpty) await CloudinaryService.delete(flower.pdfUrl);
  }
}
