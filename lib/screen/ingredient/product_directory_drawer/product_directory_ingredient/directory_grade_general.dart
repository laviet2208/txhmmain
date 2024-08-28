import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../../../data/otherdata/Time.dart';
import '../../../../../data/product/ProductDirectory.dart';
import 'directory_grade_1_item.dart';
import 'directory_grade_2_item.dart';
import 'directory_grade_3_item.dart';

class directory_grade_general extends StatefulWidget {
  final String id;
  const directory_grade_general({super.key, required this.id});

  @override
  State<directory_grade_general> createState() => _directory_grade_generalState();
}

class _directory_grade_generalState extends State<directory_grade_general> {
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), grade: 0, subList: [], productList: []);

  void get_directory() {
    if (widget.id != '') {
      final reference = FirebaseDatabase.instance.ref();
      reference.child("productDirectory").child(widget.id).child('grade').onValue.listen((event) {
        final dynamic data = event.snapshot.value;
        directory.grade = int.parse(data.toString());
        setState(() {
          getwidget();
        });
      });
    }
  }

  Widget getwidget() {
    if (directory.grade == 1) {
      return directory_grade_1_item(id: widget.id);
    }
    if (directory.grade == 2) {
      return directory_grade_2_item(id: widget.id);
    }
    if (directory.grade == 3) {
      return directory_grade_3_item(id: widget.id);
    }
    return Container();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_directory();
  }

  @override
  Widget build(BuildContext context) {
    return getwidget();
  }
}
