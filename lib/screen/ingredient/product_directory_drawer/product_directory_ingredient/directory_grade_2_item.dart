import 'package:firebase_database/firebase_database.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';
import 'package:flutter/material.dart';
import '../../../../../data/otherdata/Time.dart';
import 'expansion_title_content.dart';
import 'directory_grade_general.dart';

class directory_grade_2_item extends StatefulWidget {
  final String id;
  const directory_grade_2_item({super.key, required this.id});

  @override
  State<directory_grade_2_item> createState() => _directory_grade_2_itemState();
}

class _directory_grade_2_itemState extends State<directory_grade_2_item> {
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), grade: 0, subList: [], productList: []);
  bool _isExpanded = false;
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
      shape: Border(bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
      title: expansion_title_content(title: directory.name, left: 0,),
      onExpansionChanged: (bool expanding) => setState(() => _isExpanded = expanding),
      trailing: Transform.rotate(
        angle: _isExpanded ? 3.14159 : 0,
        child: Icon(
          Icons.expand_more,
          size: 15, // Kích cỡ của mũi tên
        ),
      ),      children: [
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
