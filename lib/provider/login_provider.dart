import 'package:flutter/cupertino.dart';
import 'package:test_sockjs_socket/models/api_response.dart';

import '../service/auth_service.dart';

class LoginProvider extends ChangeNotifier {
  String? authToken;
  String? socketToken;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<ApiResponse> loginUser(String email, String password) async {
    _isLoading = true;
    final apiResponse = await AuthService().loginUser(email, password);
    _isLoading = false;
    return apiResponse;
  }

  Future<String?> getSocketToken() async {
    final apiResponse = await AuthService().getSocketToken(authToken!);
    socketToken = (apiResponse.data as ApiToken).data;
    return socketToken;
  }
}
