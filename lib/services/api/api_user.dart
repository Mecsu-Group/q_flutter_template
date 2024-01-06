import 'package:dio/dio.dart';

import 'api.dart';

class ApiUser extends Api {
  /// Login
  Future<Response<Map<String, dynamic>>> signIn(String email, String password) async {
    final Options options = await getOptions();
    return wrapE(() => dio.post<Map<String, dynamic>>('$apiBaseUrl/signin', options: options, data: <String, String>{
          'email': email,
          'password': password,
        }));
  }

  /// Login With Error
  Future<Response<Map<String, dynamic>>> logInWithError() async {
    final Options options = await getOptions();
    return wrapE(() => dio.post<Map<String, dynamic>>('$apiBaseUrl/signin-err', options: options, data: <String, String>{
          'email': 'email',
          'password': 'password',
        }));
  }
}