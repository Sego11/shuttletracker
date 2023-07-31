// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/admin/admin_edit_buses.dart';

class AdminBusesListScreen extends StatefulWidget {
  final VoidCallback deleteBus;
  final int index;
  final String buttontext;
  const AdminBusesListScreen({
    super.key,
    required this.buttontext,
    required this.index,
    required this.deleteBus,
  });

  @override
  State<AdminBusesListScreen> createState() => _AdminBusesListScreenState();
}

class _AdminBusesListScreenState extends State<AdminBusesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slidable(
        endActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(22),
            icon: Icons.edit_note,
            backgroundColor: Colors.blueAccent,
            onPressed: (context) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditBusScreen(
                          index: widget.index,
                        )),
              );
            },
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(22),
            icon: Icons.delete,
            backgroundColor: Colors.red,
            onPressed: (context) {
              showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        22,
                      ),
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
                          'Are you sure you want',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'to delete this bus?',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: widget.deleteBus,
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
                                      color: red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
                                      color: black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
            },
          ),
        ]),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 75,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                border: Border.all(color: black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/buses.png'),
                    Text(
                      widget.buttontext,
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
