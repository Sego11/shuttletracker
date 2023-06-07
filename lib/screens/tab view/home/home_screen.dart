import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'Components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: header,
        automaticallyImplyLeading: false,
        title: Text(
          'HomePage',
          style: TextStyle(
              color: black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
