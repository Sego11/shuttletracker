// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/splash%20screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Inter'),
  ));
}
