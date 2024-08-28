import 'package:flutter/material.dart';

class messenger extends StatelessWidget {
  const messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.lightGreen,
      ),
      child: Center(
        child: Icon(
          Icons.facebook,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
