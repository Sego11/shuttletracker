import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/map%20view/map_view.dart';

// ignore: must_be_immutable
class SelectedBusType extends StatefulWidget {
  final VoidCallback screen;
  final String selectedBusName;
  int index;
  SelectedBusType({
    Key? key,
    required this.selectedBusName,
    required this.screen,
    this.index = 0,
  }) : super(key: key);

  @override
  State<SelectedBusType> createState() => _SelectedBusTypeState();
}

class _SelectedBusTypeState extends State<SelectedBusType> {
  @override
  Widget build(BuildContext context) {
    void displayBusInfo() {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: header,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${specificBusName[widget.index]} Bus',
                ),
              ],
            ),
            titleTextStyle: const TextStyle(
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                22,
              ),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Bus Number: ${specificBusNumber[widget.index]}',
                  style: const TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Destination: ${specificBusDestination[widget.index]}',
                  style: const TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Seat Numbers: ${specificBusSeatNumber[widget.index]}',
                  style: const TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        int index = busNames.indexOf(widget.selectedBusName);
                        if (index != -1) {
                          busNameSelected = busNames[index];
                        }
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => MapView())));
                      //
                    },
                    child: Text(
                      'view location on map',
                      style: TextStyle(
                        color: primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      );
    }

    void deleteBus() {
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
                      onTap: widget.screen,
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
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                displayBusInfo();
              },
              child: Container(
                height: 78,
                width: 300,
                decoration: BoxDecoration(
                  color: header,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: black,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/buses.png',
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        widget.selectedBusName,
                        style: const TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Container(
              height: 78,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: black, width: 1),
              ),
              child: IconButton(
                onPressed: () {
                  deleteBus();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
