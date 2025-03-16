import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your actual API base URL
  static String baseUrl = Platform.isAndroid
      ? 'http://10.0.2.2:8089/api' // Android emulator
      : 'http://127.0.0.1:8089/api';

  // Method to register a new user
  static Future<Map<String, dynamic>> registerUser(
      {required String name,
      required String email,
      required String phoneNumber,
      required String password,
      String notificationPreference = "push"}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'phone': phoneNumber,
          'password': password,
          'notificationPreference': notificationPreference
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Connection error: ${e.toString()}',
      };
    }
  }
}
