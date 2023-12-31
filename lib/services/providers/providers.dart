import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_flutter_template/services/providers/provider_auth.dart';
import 'package:q_flutter_template/services/providers/provider_credential.dart';
import 'package:q_flutter_template/services/api/api_user.dart';

import 'package:realm/realm.dart';
import 'package:q_flutter_template/models/account.dart';
import 'package:q_flutter_template/models/credential.dart';

late Realm _realm;

final pApiUserProvider = Provider((ref) {
  final ApiUser api = ApiUser();
  return api;
});

final pCredentialProvider = ChangeNotifierProvider((ref) {
  return CredentialProvider(_realm);
});

final pAuthProvider = ChangeNotifierProvider((ref) {
  return AuthProvider(ref.watch(pApiUserProvider), ref.watch(pCredentialProvider));
});


// ignore: prefer_function_declarations_over_variables
final databaseProvider = (String dbName) async {
  Configuration.defaultRealmName = dbName;
  final config = Configuration.local([Account.schema, Credential.schema]);
  _realm = Realm(config);
};



/// Internal Utils
