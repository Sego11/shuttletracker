// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/Components/body.dart';
import 'package:shuttle_tracker_app/screens/auth/auth_page.dart';
import 'package:shuttle_tracker_app/screens/newprofile/new_profile_screen.dart';
import 'package:shuttle_tracker_app/screens/read%20data/selected_buses.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/tab_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            loggedUserID = FirebaseAuth.instance.currentUser!.uid;
            ReadData().getAllbuses();
            return isSignUpClicked ? NewProfileScreen() : TabView();
          } else {
            return AuthPage();
          }
        }),
      ),
    );
  }
}
