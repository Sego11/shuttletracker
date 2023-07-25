// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/profile_screen_button.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/sign_up_screen.dart';
import 'package:shuttle_tracker_app/screens/read%20data/selected_buses.dart';
import '../editprofile/component/body.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    void deleteAccount() {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 57,
                ),
                const Text(
                  'Delete Account??',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // selectedBusNames.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen(
                                      showLoginScreen: () {},
                                    )),
                            (route) => false);
                      },
                      child: Container(
                        height: 63,
                        width: 109,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(
                            22,
                          ),
                          border: Border.all(
                            color: black,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 63,
                        width: 109,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(
                            22,
                          ),
                          border: Border.all(
                            color: black,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            height: 100,
            width: 360,
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
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  profileFileURL == ''
                      ? Image.asset('assets/images/person.png')
                      : Container(
                          height: 67,
                          width: 67,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(profileFileURL),
                                fit: BoxFit.cover,
                              )),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        allUsers[0].name,
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        allUsers[0].studentId.toString(),
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
            width: 306,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return ProfileScreenButton(
                      image: profileIcons[index],
                      buttonText: profileButtonText[index],
                      screen: profilescreens[index]);
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 40,
                  );
                }),
                itemCount: profileButtonText.length),
          ),
        ),
        // const SizedBox(
        //   height: 40,
        // ),
        Center(
          child: GestureDetector(
            onTap: () {
              deleteAccount();
            },
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
                    Image.asset('assets/images/deleteAccount.png'),
                    const Text(
                      'Delete Account',
                      style: TextStyle(
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
          ),
        ),
      ],
    );
  }
}
