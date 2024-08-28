import 'package:flutter/material.dart';

class top_product_name extends StatelessWidget {
  final String name;
  const top_product_name({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
