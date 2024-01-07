import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_flutter_template/safety/change_notifier_safety.dart';

import 'package:realm/realm.dart';

class CredentialProvider extends ChangeNotifierSafety {
  CredentialProvider(this._realm);

  final Realm _realm;

    @override
  void resetState() {}
}