import 'package:flutter/material.dart';

class text_field_login extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback event;
  final IconData iconData;
  const text_field_login({super.key, required this.controller, required this.hint, required this.event, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Colors.black,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent, // Background color when not focused
            border: InputBorder.none,
            icon: Icon(
              iconData,
              color: Colors.black,
            ),
            contentPadding: EdgeInsets.only(bottom: 10,),
            hintText: hint,
            labelStyle: TextStyle(color: Colors.black, fontSize: 10,),
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 12,), // Hint text color
          ),
          onChanged: (value) {
            event();
          },
          cursorColor: Color.fromARGB(255, 23, 87, 83),
        ),
      ),
    );
  }
}
