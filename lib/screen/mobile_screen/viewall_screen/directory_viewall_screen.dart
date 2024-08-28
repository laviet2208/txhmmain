import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/ingredient/bottom_page_mobile_decoration.dart';
import '../../../data/otherdata/Tool.dart';
import '../../../data/product/ProductDirectory.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import '../../ingredient/product_directory_drawer/product_directory_ingredient/directory_title/directory_title.dart';
import '../main_screen/ingredients/directory_view_in_main/item_product_in_directory_view_in_main.dart';
import '../../general_screen/appbar/mobile_main_appbar.dart';
import '../../general_screen/appbar/mobile_preview_appbar.dart';

class mobile_directory_viewall_screen extends StatefulWidget {
  final String id;
  const mobile_directory_viewall_screen({super.key, required this.id});

  @override
  State<mobile_directory_viewall_screen> createState() => _mobile_directory_viewall_screenState();
}

class _mobile_directory_viewall_screenState extends State<mobile_directory_viewall_screen> {
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: getCurrentTime(), grade: 3, subList: [], productList: []);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: RefreshIndicator(
        child: Container(
          color: Colors.blueGrey.withOpacity(0.1),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: finalData.isLogin ? mobile_main_appbar(menuEvent: () => _scaffoldKey.currentState?.openDrawer(),) : mobile_preview_appbar(menuEvent: () => _scaffoldKey.currentState?.openDrawer(),),
              ),

              Positioned(
                top: 130,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Column(
                    children: [
                      Container(height: 15,),

                      directory_title(id: directory.id, name: directory.name, type: 2,),

                      Container(height: 15,),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0, right: 0,),
                          child: ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 2, // khoảng cách giữa các hàng
                                      crossAxisSpacing: 2, // khoảng cách giữa các cột
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

                              SizedBox(height: 10,),

                              bottom_page_mobile_decoration(),
                            ],
                          ),
                        ),
                      ),

                      Container(height: 5,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onRefresh: _refresh,
      ),
      drawer: Drawer(
        width: width / (394 / 286),
        // child: type_drawer(),
        child: product_directory_drawer(),
      ),
    );
  }
}
