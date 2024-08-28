import 'package:txhmmain/data/otherdata/Time.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../general_screen/directory_viewall_screen.dart';

class directory_grade_3_item extends StatefulWidget {
  final String id;
  const directory_grade_3_item({super.key, required this.id});

  @override
  State<directory_grade_3_item> createState() => _directory_grade_3_itemState();
}

class _directory_grade_3_itemState extends State<directory_grade_3_item> {
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
    return GestureDetector(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 25,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  directory.name,
                  style: TextStyle(
                      fontFamily: 'muli',
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        print('Mã danh mục: ' + widget.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => directory_viewall_screen(id: widget.id)),);
      },
    );
  }
}
