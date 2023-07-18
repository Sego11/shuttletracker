import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Text(favBusList[index]);
            }),
            separatorBuilder: ((context, index) {
              return SizedBox(height: 15);
            }),
            itemCount: favBusList.length),
      ],
    );
  }
}
