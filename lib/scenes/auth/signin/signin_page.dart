import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:q_flutter_template/safety/base_statefull.dart';
import './signin_provider.dart';

final pSignInProvider = ChangeNotifierProvider((_) => SignInProvider());

class SignInPage extends ConsumerStatefulWidget {
    const SignInPage({Key? key, this.title}) : super(key: key);

  final String? title;

    @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends BaseStateful<SignInPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title ?? ''),
        ),
        body: const SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget> [
                    Text(
                      "Xin chào",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Đăng nhập bằng email và mật khẩu của bạn",
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20),
                  ],
                )
              ),
            ),
          ),
        ),
    );
  }
}