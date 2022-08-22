import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_sockjs_socket/models/api_response.dart';

class AuthService {
  final String baseUrl = 'https://auth-staging.chatdodo.com';

  Future<ApiResponse> loginUser(String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    String username = 'test';
    String pass = 'test';
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$pass'))}';

    try {
      final response = await http.post(Uri.parse('$baseUrl/oauth/token'), headers: <String, String>{
        'authorization': basicAuth,
      }, body: {
        'username': email,
        'password': password,
        "scope": "read write",
        "client": "test",
        "grant_type": "password",
      });

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        apiResponse.data = ApiToken.fromJson(json);
      } else {
        apiResponse.apiError = ApiError.fromJson(json);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return apiResponse;
  }

  Future<ApiResponse> getSocketToken(String token) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/oauth/token'),
        headers: <String, String>{
          'authorization': 'Bearer $token',
        },
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        apiResponse.data = ApiToken.fromJson(json);
      } else {
        apiResponse.apiError = ApiError.fromJson(json);
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    return apiResponse;
  }
}
