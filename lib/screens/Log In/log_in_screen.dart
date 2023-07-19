import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/components/body.dart';

class LogInScreen extends StatelessWidget {
  final VoidCallback showSignUpScreen;
  const LogInScreen({
    super.key,
    required this.showSignUpScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        showSignUpScreen: showSignUpScreen,
      ),
    );
  }
}
