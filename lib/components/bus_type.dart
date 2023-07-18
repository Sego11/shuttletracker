import 'package:flutter/material.dart';
import '../constants.dart';

class BusType extends StatefulWidget {
  final VoidCallback addedBus;
  final String busName;
  const BusType({
    Key? key,
    required this.busName,
   required this.addedBus,
  }) : super(key: key);

  @override
  State<BusType> createState() => _BusTypeState();
}

class _BusTypeState extends State<BusType> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.addedBus,
      child: Container(
        height: 78,
        width: 373,
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
                width: 70,
              ),
              Text(
                widget.busName,
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
    );
  }
}
