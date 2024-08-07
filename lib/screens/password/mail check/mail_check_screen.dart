import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/password/mail%20check/components/body.dart';

class MailCheckScreen extends StatelessWidget {
  const MailCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: header,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
