// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class SettingsPage extends StatelessWidget {
  final Widget screen;
  final Image image;
  final String buttontext;
  const SettingsPage({
    Key? key,
    required this.image,
    required this.buttontext, required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          child: Container(
            height: 78,
            width: 306,
            decoration: BoxDecoration(
              color: header,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: black, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  image,
                  // const SizedBox(
                  //   width: 40,
                  // ),
                  Text(
                    buttontext,
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                  )
                  // const SizedBox(width: 65),

                  // Image.asset(
                  //   'assets/images/darkonoff.png',
                  //   scale: 0.8,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
