import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_sockjs_socket/models/api_response.dart';

class AuthService {
  final String baseUrl = 'https://auth-staging.chatdodo.com';

  Future<ApiResponse> loginUser(String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    String username = 'test';
    String password = 'test';
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    try {
      final response = await http.post(Uri.parse('$baseUrl/oauth/token'), headers: <String, String>{
        "Accept": "application/json",
        'authorization': basicAuth,
      }, body: {
        'email': 'flutter@test.com',
        'password': 'Flutter123!',
        "client": "test",
        "grant_type": "password",
      });
      final json = jsonDecode(response.body);
      print(json);
      
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
