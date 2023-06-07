import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isOldPasswordSuffixIconClicked = false;
  bool isNewPasswordSuffixIconClicked = false;
  bool isConfirmPasswordSuffixIconClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 105,
          ),
          const Text(
            'Enter Old Password:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            enableSuggestions: false,
            cursorColor: black,
            obscureText: isOldPasswordSuffixIconClicked ? true : false,
            autofocus: false,
            autocorrect: false,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: const BorderSide(
                  color: black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: BorderSide(
                  color: primary,
                  width: 1,
                ),
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: (() {
                  setState(() {
                    isOldPasswordSuffixIconClicked =
                        !isOldPasswordSuffixIconClicked;
                  });
                }),
                icon: isOldPasswordSuffixIconClicked
                    ? const Icon(
                        Icons.visibility,
                        color: black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: black,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Enter New Password:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            enableSuggestions: false,
            cursorColor: black,
            obscureText: isNewPasswordSuffixIconClicked ? true : false,
            autofocus: false,
            autocorrect: false,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: const BorderSide(
                  color: black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: BorderSide(
                  color: primary,
                  width: 1,
                ),
              ),
              hintText: 'min.8 characters',
              hintStyle: const TextStyle(
                color: grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: (() {
                  setState(() {
                    isNewPasswordSuffixIconClicked =
                        !isNewPasswordSuffixIconClicked;
                  });
                }),
                icon: isNewPasswordSuffixIconClicked
                    ? const Icon(
                        Icons.visibility,
                        color: black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: black,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Confirm New Password:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            enableSuggestions: false,
            cursorColor: black,
            obscureText: isConfirmPasswordSuffixIconClicked ? true : false,
            autofocus: false,
            autocorrect: false,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: const BorderSide(
                  color: black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: BorderSide(
                  color: primary,
                  width: 1,
                ),
              ),
              hintText: 'min.8 characters',
              hintStyle: const TextStyle(
                color: grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: (() {
                  setState(
                    () {
                      isConfirmPasswordSuffixIconClicked =
                          !isConfirmPasswordSuffixIconClicked;
                    },
                  );
                }),
                icon: isConfirmPasswordSuffixIconClicked
                    ? const Icon(
                        Icons.visibility,
                        color: black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: black,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Center(
            child: Container(
              height: 65,
              width: 350,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: black,
                  width: 1,
                ),
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
