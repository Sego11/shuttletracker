import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class BottomNavTab extends StatefulWidget {
  // final VoidCallback selectedBottomNavIcon;
  final IconData icon;
  final String name;
  const BottomNavTab({
    Key? key,
    required this.icon,
    required this.name, 
    // required this.selectedBottomNavIcon,
  }) : super(key: key);

  @override
  State<BottomNavTab> createState() => _BottomNavTabState();
}

class _BottomNavTabState extends State<BottomNavTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBottomNavIconSelected = !isBottomNavIconSelected;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 40,
            color: isBottomNavIconSelected ? primary : bottomColor,
          ),
          Text(
            widget.name,
            style: TextStyle(
              color: isBottomNavIconSelected ? primary : bottomColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
