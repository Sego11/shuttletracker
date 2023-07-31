import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/Components/body.dart';

class SignUpScreen extends StatelessWidget {
  final VoidCallback showLoginScreen;
  const SignUpScreen({
    super.key,
    required this.showLoginScreen,
  });

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Body(
          showLoginScreen: showLoginScreen,
        ),
      ),
      backgroundColor: white,
    );
  }
}
