import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_flutter_template/app/app_route.dart';


void appExtension() {}

class AppExtension {}

extension WidgetRefExt on WidgetRef {
  NavigatorState? navigator() {
    return AppRoute.I.navigatorKey.currentState;
  }
}
