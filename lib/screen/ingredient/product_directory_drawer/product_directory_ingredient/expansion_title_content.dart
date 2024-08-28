import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class expansion_title_content extends StatelessWidget {
  final String title;
  final double left;
  const expansion_title_content({super.key, required this.title, required this.left,});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 0, left: left),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'muli',
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
