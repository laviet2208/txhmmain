import 'package:firebase_database/firebase_database.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/ingredient/product_directory_ingredient/directory_grade_general.dart';
import '../../../data/otherdata/Time.dart';
import 'expansion_title_content.dart';

class directory_grade_1_item extends StatefulWidget {
  final String id;
  const directory_grade_1_item({super.key, required this.id});

  @override
  State<directory_grade_1_item> createState() => _directory_grade_1_itemState();
}

class _directory_grade_1_itemState extends State<directory_grade_1_item> {
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), grade: 0, subList: [], productList: []);

  void get_directory() {
    if (widget.id != '') {
      final reference = FirebaseDatabase.instance.ref();
      reference.child("productDirectory").child(widget.id).onValue.listen((event) {
        final dynamic data = event.snapshot.value;
        directory = ProductDirectory.fromJson(data);
        setState(() {

        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_directory();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border(bottom: BorderSide(width: 0.5, color: Colors.black)),
      title: expansion_title_content(title: directory.name, left: 0,),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: directory.subList.length,
            itemBuilder: (context, index) {
              return directory_grade_general(id: directory.subList[index]);
            },
          ),
        ),
      ],
    );
  }
}
