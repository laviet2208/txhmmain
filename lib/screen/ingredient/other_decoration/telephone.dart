import 'package:flutter/material.dart';

class telephone extends StatelessWidget {
  const telephone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.blueAccent,
      ),
      child: Center(
        child: Icon(
          Icons.phone,
          color: Colors.white,
          size: 30,
        ),
      ),
    );  }
}
