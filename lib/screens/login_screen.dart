import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:meals_app/constant/routes.dart';

var users = {
  'uogi123@gmail.com': '1234',
};

String? currentLogin; 

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key});

  final Duration delayLogin = const Duration(seconds: 1);

  Future<String?> _authUser(LoginData loginData) {
    return Future<String?>.delayed(delayLogin).then((value) {
      if (!users.keys.contains(loginData.name)) {
        return 'User does not exists';
      }
      if (!users.values.contains(loginData.password)) {
        return 'Wrong Password';
      }
      currentLogin = loginData.name;
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(delayLogin).then((_) {
      users[data.name!] = data.password!;
      currentLogin = data.name;
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(delayLogin).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return users[name]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'MealIt',
      logo: const AssetImage('assets/logo.jpg'),
      onSignup: _signupUser,
      onLogin: _authUser,
      onSubmitAnimationCompleted: () => Navigator.of(context).pushReplacementNamed(homeScreenRoute),
      onRecoverPassword: _recoverPassword,
    );
  }
}
