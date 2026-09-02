import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserService{
    static const String API_URL = "http://localhost:4000/users";

    static Future<Map<String,dynamic>> register(User user) async {
        final response = await http.post(
            Uri.parse(API_URL),
            headers: {"Content-Type": "application/json"},
            body: json.encode(user.toJson()),
        );
        return jsonDecode(response.body);
    }

    static Future<Map<String, dynamic>> login(
        String username,
        String password,
    ) async {
        final response = await http.post(
            Uri.parse(API_URL + "/login"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({"username": username, "password": password}),
        );
        return jsonDecode(response.body);
    }
}