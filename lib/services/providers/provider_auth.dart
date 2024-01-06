import 'package:dio/dio.dart';
import 'package:q_flutter_template/safety/change_notifier_safety.dart';
import 'package:q_flutter_template/services/api/api_user.dart';

class AuthProvider extends ChangeNotifierSafety {
  AuthProvider(this._api);

    /// Authentication api
  final ApiUser _api;


  @override
  void resetState() {}

  Future<bool> signIn(String email, String password) async {
    final Response<Map<String, dynamic>> result = 
      await _api.signIn(email, password).timeout(const Duration(seconds: 30));
    print(result);

    if (result != null) {
      /// Save credential
      // final bool saveRes = await _credential.add(token, cache: true);
      print('Should be saved');
      
      return true;
    } else {
      throw DioError(
          requestOptions: result.requestOptions,
          error: 'Login error',
          type: DioErrorType.badResponse);
    }
  }

}