import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import '../../../../../components/bus_type.dart';

class AddingBusScreen extends StatefulWidget {
  const AddingBusScreen({super.key});

  @override
  State<AddingBusScreen> createState() => _AddingBusScreenState();
}

class _AddingBusScreenState extends State<AddingBusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: header,
        leading: const DefaultBackButton(),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      22,
                    ),
                    borderSide: const BorderSide(
                      color: black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      22,
                    ),
                    borderSide: BorderSide(
                      color: primary,
                      width: 1,
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: black,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BusType(
                    addedBus: () {
                      Navigator.pop(context, busNames[index]);
                    },
                    busName: busNames[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 45);
                },
                itemCount: busNames.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
