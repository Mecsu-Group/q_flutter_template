import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:q_flutter_template/utils/app_log.dart';

import 'package:q_flutter_template/safety/base_statefull.dart';
import './signin_provider.dart';
import 'package:q_flutter_template/constants.dart';

final pSignInProvider = ChangeNotifierProvider((_) => SignInProvider());

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key, this.title}) : super(key: key);

  final String? title;

    @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends BaseStateful<SignInPage> with WidgetsBindingObserver {

  late SignInProvider signInProvider;

  @override
  void initDependencies(WidgetRef ref) {
    super.initDependencies(ref);
    signInProvider = ref.read(pSignInProvider);
  }

   @override
  void afterFirstBuild(WidgetRef ref) {
    signInProvider.resetState();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.d(state);
  }

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
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
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
                    buildEmailFormField(),

                    SizedBox(height: 20),
                    buildPasswordFormField(),

                    SizedBox(height: 20),

                    /// Example call api with success http code but with error response,
                    /// and how to use function response data instead property approach.
                    ElevatedButton(
                      key: const Key('SignIn'),
                      onPressed: () {
                      },
                      child: const Text('Sign in'),
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      onChanged: signInProvider.onEmailChangeToValidateForm,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      // onSaved: (newValue) => email = newValue,
      onChanged: signInProvider.onPasswordChangeToValidateForm,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}