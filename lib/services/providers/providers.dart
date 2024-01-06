import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_flutter_template/services/providers/provider_auth.dart';
import 'package:q_flutter_template/services/api/api_user.dart';

final pApiUserProvider = Provider((ref) {
  final ApiUser api = ApiUser();
  return api;
});

final pAuthProvider = ChangeNotifierProvider((ref) {
  return AuthProvider(ref.watch(pApiUserProvider));
});