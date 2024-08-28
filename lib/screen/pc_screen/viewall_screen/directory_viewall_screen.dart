import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../data/otherdata/Tool.dart';
import '../../../data/product/ProductDirectory.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../ingredient/bottom_page_pc_decoration.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import '../../ingredient/product_directory_drawer/product_directory_ingredient/directory_title/directory_pc_title.dart';
import '../preview_screen/ingredient/directory_view_in_main/item_product_in_directory_view_in_main.dart';

class pc_directory_viewall_screen extends StatefulWidget {
  final String id;
  const pc_directory_viewall_screen({super.key, required this.id});

  @override
  State<pc_directory_viewall_screen> createState() => _pc_directory_viewall_screenState();
}

class _pc_directory_viewall_screenState extends State<pc_directory_viewall_screen> {
  bool isOpen = true;
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: getCurrentTime(), grade: 3, subList: [], productList: []);
  void get_directory_data() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productDirectory").child(widget.id).onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      directory = ProductDirectory.fromJson(data);
      setState(() {

      });
    });
  }

  Future<void> _refresh() async {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _refresh();
    get_directory_data();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 248, 249),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: general_app_bar(event: () {
                  if (isOpen) {
                    setState(() {
                      isOpen = false;
                    });
                  } else {
                    setState(() {
                      isOpen = true;
                    });
                  }
                },),
              ),

              Positioned(
                top: height/13,
                left: width/3 - width/7 - 65,
                child: Container(
                  width: width/7,
                  height: isOpen ? (height - height/13 - 10) : 0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: product_directory_drawer(),
                ),
              ),

              Positioned(
                top: height/13,
                left: width/3,
                bottom: 0,
                child: Container(
                  width: width/2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: 10,),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(height: 15,),

                          directory_pc_title(id: directory.id, name: directory.name, type: 2,),

                          Container(height: 15,),

                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 0, // khoảng cách giữa các hàng
                                  crossAxisSpacing: 0, // khoảng cách giữa các cột
                                  childAspectRatio: 2/3,
                                ),
                                itemCount: directory.productList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return item_product_in_directory_view_in_main(id: directory.productList[index]);
                                },
                              ),
                            ),
                          ),

                          Container(height: 20,),
                        ],
                      ),

                      Container(height: 20,),

                      bottom_page_pc_decoration(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
