import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class ProfileScreenButton extends StatelessWidget {
  final Image image;
  final Widget screen;
  final String buttonText;
  const ProfileScreenButton({
    Key? key,
    required this.image,
    required this.buttonText,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            (MaterialPageRoute(
              builder: (context) => screen,
            )));
      }),
      child: Container(
        height: 78,
        width: 306,
        decoration: BoxDecoration(
          color: header,
          borderRadius: BorderRadius.circular(
            22,
          ),
          border: Border.all(
            color: black,
            width: 1,
          ),
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
              Text(
                buttonText,
                style: const TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
