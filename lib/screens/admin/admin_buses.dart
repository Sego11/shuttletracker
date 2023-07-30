// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/admin_buses_list_screen.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/admin/admin_add_buses.dart';
import 'package:shuttle_tracker_app/screens/read%20data/selected_buses.dart';

class AdminBusesScreen extends StatefulWidget {
  const AdminBusesScreen({super.key});

  @override
  State<AdminBusesScreen> createState() => _AdminBusesScreenState();
}

class _AdminBusesScreenState extends State<AdminBusesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primary,
        title: Text(
          'Buses',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: black,
        ),
      ),
      body: FutureBuilder(
          future: ReadData().getAllbuses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AdminBusesListScreen(
                            deleteBus: () {
                              setState(() {
                                ReadData().deleteBus(index);
                                Navigator.pop(context);
                              });
                            },
                            index: index,
                            buttontext: allBuses[index].name);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 30,
                        );
                      },
                      itemCount: allBuses.length)
                ],
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Could not load data. Try againn later'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(color: primary),
              );
            }
            return Center(
              child: CupertinoActivityIndicator(color: primary),
            );
          }),
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
        child: IconButton(
          icon: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminAddBusScreen())),
        ),
      ),
    );
  }
}
