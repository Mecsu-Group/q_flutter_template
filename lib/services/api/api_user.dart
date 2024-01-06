import 'package:dio/dio.dart';

import 'api.dart';

class ApiUser extends Api {
  /// Sign in
  Future<Response<Map<String, dynamic>>> signIn(String email, String password) async {
    final Options options = await getOptions();
    final data = FormData.fromMap({
      'username': email,
      'password': password,
    });
    return wrapE(() => dio.post<Map<String, dynamic>>(
      '$apiBaseUrl/$apiSignIn', 
      options: options, 
      data: data));
  }
}