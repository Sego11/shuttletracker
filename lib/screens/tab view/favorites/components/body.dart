import 'package:flutter/material.dart';

import 'package:shuttle_tracker_app/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 305,
        ),
        Center(
          child: Text(
            'No favourites added',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 360,
        ),
        // Center(
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
        // )
      ],
    );
  }
}
