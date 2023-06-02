import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/Components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
   
    return const Scaffold(
      body: Body(),
      backgroundColor: white,
    );
  }
}
