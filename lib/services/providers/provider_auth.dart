import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:q_flutter_template/models/account.dart';
import 'package:q_flutter_template/safety/change_notifier_safety.dart';
import 'package:q_flutter_template/services/api/api_user.dart';

import 'package:q_flutter_template/services/providers/provider_credential.dart';
import 'package:realm/realm.dart';


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
      final token = Token.fromJson(result.data as Map<String, dynamic>);
      if(token.accessToken.isNotEmpty) {
        final userAccount = Account(ObjectId());
        userAccount.emailAddress = email;
        userAccount.password = password;
        await _credential.saveCredential(token, userAccount);
      }

      return false;
    } else {
      throw DioError(
          requestOptions: result.requestOptions,
          error: 'Login error',
          type: DioErrorType.badResponse);
    }
  }
}