import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/ingredient/product_directory_ingredient/directory_grade_general.dart';

import '../../../../data/product/ProductDirectory.dart';

class product_directory_drawer extends StatefulWidget {
  const product_directory_drawer({super.key});

  @override
  State<product_directory_drawer> createState() => _product_directory_drawerState();
}

class _product_directory_drawerState extends State<product_directory_drawer> {
  List<String> keyList = [];

  // void getData() {
  //   final reference = FirebaseDatabase.instance.ref();
  //   final DatabaseReference _database = FirebaseDatabase.instance.ref().child('productDirectory');
  //   reference.child("productDirectory").onChildAdded.listen((event) {
  //     final dynamic key = event.snapshot.key;
  //     if (key != null && !keyList.contains(key)) {
  //       keyList.add(key.toString());
  //       setState(() {});
  //     }
  //   });
  //   reference.child("productDirectory").onChildRemoved.listen((event) {
  //     final dynamic key = event.snapshot.key;
  //     if (key != null && keyList.contains(key)) {
  //       keyList.remove(key);
  //       setState(() {});
  //     }
  //   });
  // }

  void get_directory_list() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productDirectory").onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      data.forEach((key, value) {
        ProductDirectory directory = ProductDirectory.fromJson(value);
        if (directory.grade == 1) {
          keyList.add(directory.id);
        }
      });
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_directory_list();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: keyList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              directory_grade_general(id: keyList[index]),

              Container(
                height: 0.3,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
