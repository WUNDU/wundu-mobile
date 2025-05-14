import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wundu/core/local_storage/local_preferences.dart';

class ApiService {
  // Replace with your actual API base URL
  static String baseUrl =
      'https://api-finaces-app-production.up.railway.app/api';
  // static String baseUrl = Platform.isAndroid
  //     ? 'http://10.0.2.2:8089/api' // Android emulator
  //     : 'http://127.0.0.1:8089/api';

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
          'message': responseData['message'] ?? 'Falha no registro',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Falha no registro',
      };
    }
  }

  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      // Check for empty response first

      Map<String, dynamic> responseData;
      try {
        responseData = jsonDecode(response.body);
      } catch (e) {
        // Trata erros específicos de status code mesmo com resposta não-JSON
        if (response.statusCode == 401) {
          return {
            'success': false,
            'message': 'Credenciais inválidas. Verifique seus dados.',
          };
        } else if (response.statusCode >= 400 && response.statusCode < 500) {
          return {
            'success': false,
            'message': 'Erro na requisição. Verifique seus dados.',
          };
        } else {
          return {
            'success': false,
            'message': 'Problema no servidor. Tente novamente mais tarde.',
          };
        }
      }

      if (response.statusCode == 200) {
        if (responseData['token'] != null) {
          await _saveAuthToken(responseData['token']);
          final userData = responseData['userDTO'] ?? {};
          await _saveUserData(userData);

          await LocalPreferences().setLastUsedEmail(userData['email'] ?? '');
        }
        return {
          'success': true,
          'data': responseData,
          'token': responseData['token'] ?? '',
        };
      } else {
        String userMessage;
        if (response.statusCode == 401) {
          userMessage = responseData['message'] ??
              'Credenciais inválidas. Verifique e-mail e senha.';
        } else {
          userMessage = responseData['message'] ??
              'Erro ao processar solicitação. Código: ${response.statusCode}';
        }
        return {
          'success': false,
          'message': userMessage,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Erro de conexão. Verifique sua internet e tente novamente.',
      };
    }
  }

  // Save auth token to SharedPreferences
  static Future<void> _saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Save user data to SharedPreferences
  static Future<void> _saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(userData));
  }

  // Get stored auth token
  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Get stored user data
  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');
    if (userDataString != null) {
      return jsonDecode(userDataString) as Map<String, dynamic>;
    }
    return null;
  }

  // Logout - clear stored data
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_data');
  }
}
