import 'package:flutter/material.dart';

import '../../../../data/finalUnchangeData.dart';

class main_type_product extends StatefulWidget {
  const main_type_product({super.key});

  @override
  State<main_type_product> createState() => _main_type_productState();
}

class _main_type_productState extends State<main_type_product> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/2.5;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: ((width - 60)/4) / (252/181),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: finalUnchangeData.product_type_url_list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 3 ? 0 : 20),
            child: Container(
              width: (width - 60)/4,
              height: ((width - 60)/4) / (252/181),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  finalUnchangeData.product_type_url_list[index],
                  width: (width - 60)/4,
                  height: ((width - 60)/4) / (252/181),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
