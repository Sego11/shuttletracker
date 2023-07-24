// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/splash%20screen/next_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 300,
        splash: Image.asset('assets/icons/logo.png'),
        nextScreen: NextSplashScreen(),
        animationDuration: Duration(seconds: 2),
        pageTransitionType: PageTransitionType.fade,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
