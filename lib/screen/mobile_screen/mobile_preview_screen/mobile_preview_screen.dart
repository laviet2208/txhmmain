import 'package:firebase_database/firebase_database.dart';
import 'package:txhmmain/screen/general_screen/ingredient/preview_ingredient/bottom_page_mobile_decoration.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/ingredient/preview_screen_ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'package:txhmmain/screen/ingredient/product_directory_ingredient/directory_title/directory_title.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_preview_screen/ingredient/directory_view_in_main/directory_view_in_main.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_preview_screen/ingredient/directory_view_in_main/sale_limit_view_in_main.dart';

import 'ingredient/logo_type_list/logo_type_list.dart';
import 'ingredient/main_type_product/main_type_product.dart';

class mobile_preview_screen extends StatefulWidget {
  const mobile_preview_screen({super.key});

  @override
  State<mobile_preview_screen> createState() => _mobile_preview_screenState();
}

class _mobile_preview_screenState extends State<mobile_preview_screen> {
  List<String> directoryList = [];

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("UiManager").onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      directoryList.clear();
      for (final result in data["mainUI"]) {
        directoryList.add(result.toString());
        print(result.toString());
      }
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
                child: Container(
                  height: height / (651 / 122),
                  width: width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 215, 220),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 10,
                        left: (width - (64 * (535 / 150))) / 2,
                        right: (width - (64 * (535 / 150))) / 2,
                        child: Container(
                          height: 64,
                          width: 64 * (535 / 150),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/mainlogo.png'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 74,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: height / (651 / 40),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                child: Builder(
                                  builder: (context) => GestureDetector(
                                    child: Container(
                                      width: height / (651 / 40),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,
                                      ),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onTap: () => Scaffold.of(context).openDrawer(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 5,
                top: height / (651 / 122) + 5,
                child: Container(
                  child: ListView(
                    children: [
                      Container(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: main_type_product(),
                      ),

                      Container(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: logo_type_list(),
                      ),

                      Container(height: 20,),

                      sale_limit_view_in_main(),

                      Container(height: 20,),

                      Container(
                        child: ListView.builder(
                          itemCount: directoryList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: directory_view_in_main(id: directoryList[index]),
                            );
                          },
                        ),
                      ),

                      Container(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: bottom_page_mobile_decoration(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          width: width / (394 / 286),
          // child: type_drawer(),
          child: product_directory_drawer(),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
