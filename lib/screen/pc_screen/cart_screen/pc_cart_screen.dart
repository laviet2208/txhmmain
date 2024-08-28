import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/pc_screen/cart_screen/ingredient/item_cart_pc.dart';
import '../../../data/finalData.dart';
import '../../../data/otherdata/Tool.dart';
import '../../../data/voucherData/Voucher.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../ingredient/bottom_page_pc_decoration.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'ingredient/caculate_total_money.dart';

class pc_cart_screen extends StatefulWidget {
  const pc_cart_screen({super.key});

  @override
  State<pc_cart_screen> createState() => _pc_cart_screenState();
}

class _pc_cart_screenState extends State<pc_cart_screen> {
  bool isOpen = true;
  final Voucher voucher = Voucher(id: '', Money: 0, mincost: 0, startTime: getCurrentTime(), endTime: getCurrentTime(), useCount: 0, maxCount: 0, eventName: '', type: 0, perCustom: 0, CustomList: [], maxSale: 0);

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
                        height: 40,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
                          child: AutoSizeText(
                            'Giỏ hàng của bạn(' + finalData.cartList.length.toString() + ')',
                            style: TextStyle(
                              fontFamily: 'muli',
                              fontSize: 100,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: ListView.builder(
                          itemCount: finalData.cartList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return item_cart_pc(cartdata: finalData.cartList[index], event: () { setState(() {});},);
                          },
                        ),
                      ),

                      caculate_total_money(voucher: voucher,),

                      SizedBox(height: 10,),

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
