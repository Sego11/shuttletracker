// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class AdminBusesListScreen extends StatelessWidget {
  final String buttontext;
  const AdminBusesListScreen({
    super.key,
    required this.buttontext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 75,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                border: Border.all(color: black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/buses.png'),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
