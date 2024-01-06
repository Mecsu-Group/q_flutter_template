import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:q_flutter_template/services/api/api_error.dart';
import 'package:q_flutter_template/safety/base_stateful.dart';

import 'package:q_flutter_template/services/providers/provider_auth.dart';
import 'package:q_flutter_template/services/providers/providers.dart';

abstract class PageStateful<T extends ConsumerStatefulWidget> extends BaseStateful<T> with ApiError {

  late AuthProvider authProvider;

  @mustCallSuper
  @override
  void initDependencies(WidgetRef ref) {
    super.initDependencies(ref);

    authProvider = ref.read(pAuthProvider);
  }
}
