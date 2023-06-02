import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/main.dart';

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
                  'Confirm Delete Account',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
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

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          TextField(
            autofocus: false,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(
                  color: primary,
                  width: 1,
                ),
              ),
              hintText: 'search settings',
              hintStyle: const TextStyle(
                color: grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: black,
                  size: 25,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 306,
                    decoration: BoxDecoration(
                      color: header,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/theme.png',
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            'Dark Theme',
                            style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Image.asset(
                            'assets/images/darkonoff.png',
                            scale: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 306,
                    decoration: BoxDecoration(
                      color: header,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/terms.png',
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          const Text(
                            'Rules & Terms',
                            style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 65,
                          ),
                          Image.asset(
                            'assets/images/forward.png',
                            scale: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 306,
                    decoration: BoxDecoration(
                      color: header,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/FAQ's.png",
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          const Text(
                            "FAQ's",
                            style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 95,
                          ),
                          Image.asset(
                            'assets/images/forward.png',
                            scale: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 306,
                    decoration: BoxDecoration(
                      color: header,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/rate.png',
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'Rate us',
                            style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                          ),
                          Image.asset(
                            'assets/images/forward.png',
                            scale: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 78,
                    width: 306,
                    decoration: BoxDecoration(
                      color: header,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/support.png',
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'Support',
                            style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 86,
                          ),
                          Image.asset(
                            'assets/images/forward.png',
                            scale: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  onTap: () {
                    deleteAccount();
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/deleteAccount.png',
                            scale: 1.2,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            'Delete Account',
                            style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 48,
                          ),
                          Image.asset(
                            'assets/images/forward.png',
                            scale: 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
