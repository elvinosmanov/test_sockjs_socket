class ApiResponse {
  Object? data;
  ApiError? apiError;
}

class ApiError {
  String? error;

  ApiError({String? error}) {
    this.error = error ?? '';
  }

  ApiError.fromJson(Map<String, dynamic> json) {
    error = json['error_description'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {'error_description': error};
  }
}

class ApiToken {
  String? data;

  ApiToken(this.data);

  ApiToken.fromJson(Map<String, dynamic> json) {
    data = json['access_token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {'access_token': data};
  }
}
