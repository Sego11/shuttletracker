// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/components/body.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/sub/adding%20bus/adding_bus_screen.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  //function to remove an object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primary,
          border: Border.all(
            color: black,
            width: 1,
          ),
        ),
        child: Center(
          child: IconButton(
            onPressed: selectedBusNames.length == busNames.length
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'All buses have been selected. Remove buses to access Available Bus List',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                : () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddingBusScreen(),
                      ),
                    );

                    // if (result != null) {
                    //prevents duplicates of bus names in selectedBusNames list
                    //   if (!selectedBusNames.contains(result)) {
                    //     setState(() {
                    //       selectedBusNames.add(result);
                    //     });
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         behavior: SnackBarBehavior.floating,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         content: Padding(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 14.0),
                    //           child: Text(
                    //             '$result had already been added.',
                    //             style: const TextStyle(height: 1.3),
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   }
                    // }
                  },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: header,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ],
        title: const Text(
          'Buses',
          style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
