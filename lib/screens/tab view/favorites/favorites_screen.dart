import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/favorites/components/body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: header,
        elevation: 0,
        //leading: const DefaultBackButton(),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ],
        title: const Text(
          'Favourites',
        ),
        titleTextStyle: const TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Body(),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
      //   child: Container(
      //     height: 93,
      //     width: 375,
      //     decoration: BoxDecoration(
      //       color: white,
      //       borderRadius: BorderRadius.circular(22),
      //       border: Border.all(
      //         color: black,
      //         width: 1,
      //       ),
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 60,
      //           child: ListView.separated(
      //             scrollDirection: Axis.horizontal,
      //             physics: NeverScrollableScrollPhysics(),
      //             shrinkWrap: true,
      //             itemCount: 4,
      //             itemBuilder: ((context, index) {
      //               return BottomNavTab(
      //                 icon: bottomNavIcon[index],
      //                 name: bottomNavTitle[index],
      //               );
      //             }),
      //             separatorBuilder: (context, index) {
      //               return SizedBox(
      //                 width: 35,
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
