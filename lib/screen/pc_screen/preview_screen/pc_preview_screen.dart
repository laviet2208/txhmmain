import 'package:flutter/material.dart';
import 'package:txhmmain/screen/ingredient/bottom_page_mobile_decoration.dart';
import 'package:txhmmain/screen/ingredient/bottom_page_pc_decoration.dart';
import 'package:txhmmain/screen/ingredient/other_decoration/messenger.dart';
import 'package:txhmmain/screen/ingredient/other_decoration/telephone.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'ingredient/adsArea.dart';
import '../../../data/finalData.dart';
import '../../mobile_screen/main_screen/controller/mobile_main_controller.dart';
import 'ingredient/directory_view_in_main/directory_view_in_main.dart';
import 'ingredient/directory_view_in_main/sale_limit_view_in_main.dart';
import 'ingredient/logo_type_list.dart';
import 'ingredient/main_type_product.dart';

class pc_preview_screen extends StatefulWidget {
  const pc_preview_screen({super.key});

  @override
  State<pc_preview_screen> createState() => _pc_preview_screenState();
}

class _pc_preview_screenState extends State<pc_preview_screen> {
  bool isOpen = true;
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

                      Container(
                        height: width/5,
                        child: adsArea(),
                      ),

                      SizedBox(height: 10,),

                      main_type_product(),

                      SizedBox(height: 10,),

                      logo_type_list(),

                      SizedBox(height: 10,),

                      sale_limit_view_in_main(),

                      Container(height: 20,),

                      Container(
                        child: ListView.builder(
                          itemCount: finalData.directoryListId.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: directory_view_in_main(id: finalData.directoryListId[index]),
                            );
                          },
                        ),
                      ),

                      Container(height: 20,),

                      bottom_page_pc_decoration(),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                right: 10,
                child: messenger(),
              ),

              Positioned(
                bottom: 70,
                right: 10,
                child: telephone(),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
