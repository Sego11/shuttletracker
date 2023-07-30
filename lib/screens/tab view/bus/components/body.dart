// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/read%20data/selected_buses.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/sub/adding%20bus/adding_bus_screen.dart';
import '../../../../components/selected_bus_type_screen.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

int busRemovalIndex = 0;

class _BodyState extends State<Body> {
  ReadData readData = ReadData();

  Future removeBus(String busName) async {
    final document = await FirebaseFirestore.instance
        .collection('added buses')
        .where('User ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (document.docs.isNotEmpty) {
      final id = document.docs.single.id;
      await FirebaseFirestore.instance
          .collection('added buses')
          .doc(id)
          .update({'Added Bus IDs': addedBuses});
    }
    setState(() {
      selectedBusNames.remove(busName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readData.getSelectedBuses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: selectedBusNames.isNotEmpty ? 45 : 300,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    selectedBusNames.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (((context, index) {
                              return SelectedBusType(
                                index: index,
                                screen: (() {
                                  addedBuses.removeAt(index);
                                  removeBus(selectedBusNames[index]);
                                  Navigator.pop(context);
                                }),
                                selectedBusName: selectedBusNames[index],
                              );
                            })),
                            separatorBuilder: ((context, index) {
                              return const SizedBox(
                                height: 45,
                              );
                            }),
                            itemCount: selectedBusNames.length)
                        : const Center(
                            child: Text(
                              'No Bus Added',
                              style: TextStyle(
                                fontSize: 16,
                                color: black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CupertinoActivityIndicator(),
          );
        });
  }
}
