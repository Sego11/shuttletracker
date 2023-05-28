import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Firebase.initializeApp;
  runApp(const MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}


