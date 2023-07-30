// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/read%20data/selected_buses.dart';
import '../../components/edit_buses_list_screen.dart';
import 'admin.dart';

class EditBusScreen extends StatefulWidget {
  final int index;
  const EditBusScreen({super.key, required this.index});

  @override
  State<EditBusScreen> createState() => _EditBusScreenState();
}

class _EditBusScreenState extends State<EditBusScreen> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _destinationController = TextEditingController();
  final _seatNumberController = TextEditingController();
  final _startController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _destinationController.dispose();
    _seatNumberController.dispose();
    _startController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primary,
        title: Text(
          ' Edit Buses',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            EditBusesListScreen(
              controller: _nameController,
              busFieldText: 'Enter Bus Name',
              busFieldHintText: 'Enter bus name here',
            ),
            EditBusesListScreen(
              controller: _numberController,
              busFieldText: 'Enter Bus Number',
              busFieldHintText: 'Enter bus number here',
            ),
            EditBusesListScreen(
              controller: _destinationController,
              busFieldText: 'Destination',
              busFieldHintText: 'Enter Destination',
            ),
            EditBusesListScreen(
              controller: _seatNumberController,
              busFieldText: 'Seat Number',
              busFieldHintText: 'Enter Number of seats',
            ),
            EditBusesListScreen(
              controller: _startController,
              busFieldText: 'Start',
              busFieldHintText: 'enter starting point',
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                ReadData().updateBus(
                  allBuses[widget.index].id,
                  _nameController.text.trim(),
                  _numberController.text.trim(),
                  _destinationController.text.trim(),
                  int.parse(_seatNumberController.text.trim()),
                  _startController.text.trim(),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminScreen(),
                    ));
              },
              child: Container(
                height: 63,
                width: 300,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: black, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
