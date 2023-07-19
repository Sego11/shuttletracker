import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/log_in_screen.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/sign_up_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showloginPage = true;

  void toggleScreen() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage) {
      return LogInScreen(
        showSignUpScreen: toggleScreen,
      );
    } else {
      return SignUpScreen(
        showLoginScreen: toggleScreen,
      );
    }
  }
}
