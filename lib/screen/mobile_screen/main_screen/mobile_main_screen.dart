import 'package:flutter/material.dart';
import '../../../data/finalData.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../ingredient/bottom_page_mobile_decoration.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'controller/mobile_main_controller.dart';
import 'ingredients/adsArea.dart';
import 'ingredients/directory_view_in_main/directory_view_in_main.dart';
import 'ingredients/directory_view_in_main/sale_limit_view_in_main.dart';
import 'ingredients/logo_type_list.dart';
import 'ingredients/main_type_product.dart';

class mobile_main_screen extends StatefulWidget {
  const mobile_main_screen({super.key});

  @override
  State<mobile_main_screen> createState() => _mobile_main_screenState();
}

class _mobile_main_screenState extends State<mobile_main_screen> {
  Future<void> _refresh() async {
    finalData.AdsUrls = await mobile_main_controller.getAllImageURL('ads');
    setState(() {

    });
    finalData.directoryListId = await mobile_main_controller.getDirectoryList();
    setState(() {

    });
    finalData.reloadTime = -1;
    finalData.reloadTime = finalData.reloadTime + 1;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (finalData.reloadTime > 3 || finalData.reloadTime == -1) {
      _refresh();
    } else {
      finalData.reloadTime = finalData.reloadTime + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: general_app_bar(event: () => _scaffoldKey.currentState?.openDrawer(),),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 5,
                    top: height / (651 / 122) + 5,
                    child: Container(
                      child: ListView(
                        children: [
                          adsArea(),

                          Container(height: 10,),

                          main_type_product(),

                          Container(height: 20,),

                          logo_type_list(),

                          Container(height: 20,),

                          sale_limit_view_in_main(),

                          Container(height: 20,),

                          Container(
                            child: ListView.builder(
                              itemCount: finalData.directoryListId.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: directory_view_in_main(id: finalData.directoryListId[index]),
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
          onRefresh: _refresh,
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
