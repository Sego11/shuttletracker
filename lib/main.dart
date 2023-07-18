import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/log_in_screen.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/sign_up_screen.dart';
import 'package:shuttle_tracker_app/screens/map%20view/map_view.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/sub/adding%20bus/adding_bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/favorites/favorites_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/home/home_screen.dart';
import 'package:shuttle_tracker_app/screens/password/forgot%20password/forgot_password_screen.dart';
import 'package:shuttle_tracker_app/screens/password/mail%20check/mail_check_screen.dart';
import 'package:shuttle_tracker_app/screens/password/new%20password/new_password_screen.dart';
import 'package:shuttle_tracker_app/screens/newprofile/new_profile_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/settings_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/tab_view.dart';
import 'package:shuttle_tracker_app/screens/verify/verify_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Firebase.initializeApp;
  runApp(MaterialApp(
    home: TabView(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Inter'),
  ));
}
