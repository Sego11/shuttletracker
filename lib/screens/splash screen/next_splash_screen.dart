// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/auth/main_page.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class NextSplashScreen extends StatelessWidget {
  const NextSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/icons/logo.png'),
        nextScreen: MainPage(),
        splashIconSize: 300,
        backgroundColor: primary,
        duration: 3000,
        pageTransitionType: PageTransitionType.bottomToTop,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
