import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_flutter_template/safety/change_notifier_safety.dart';
import 'package:q_flutter_template/services/api/api_user.dart';

import 'package:q_flutter_template/services/providers/provider_credential.dart';
import 'package:q_flutter_template/services/providers/providers.dart';


class AuthProvider extends ChangeNotifierSafety {
  AuthProvider(this._api, this._credential);

  /// Authentication api
  final ApiUser _api;

  final CredentialProvider _credential;

  @override
  void resetState() {}

  Future<bool> signIn(String email, String password) async {
    final Response<Map<String, dynamic>> result = 
      await _api.signIn(email, password).timeout(const Duration(seconds: 30));

    // ignore: unnecessary_null_comparison
    if (result != null) {
      return true;
    } else {
      throw DioError(
          requestOptions: result.requestOptions,
          error: 'Login error',
          type: DioErrorType.badResponse);
    }
  }
}