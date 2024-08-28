import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/general_screen/appbar/mobile_preview_appbar.dart';

import '../../../data/otherdata/Tool.dart';
import '../../../data/voucherData/Voucher.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'ingredient/caculate_total_money.dart';
import 'ingredient/item_cart.dart';

class mobile_cart_screen extends StatefulWidget {
  const mobile_cart_screen({super.key,});

  @override
  State<mobile_cart_screen> createState() => _mobile_cart_screenState();
}

class _mobile_cart_screenState extends State<mobile_cart_screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Voucher voucher = Voucher(id: '', Money: 0, mincost: 0, startTime: getCurrentTime(), endTime: getCurrentTime(), useCount: 0, maxCount: 0, eventName: '', type: 0, perCustom: 0, CustomList: [], maxSale: 0);
  Future<void> _Refresh() async {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: general_app_bar(event: () => _scaffoldKey.currentState?.openDrawer(),),
            ),

            Positioned(
              top: 130,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: RefreshIndicator(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
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
                            return item_cart(cartdata: finalData.cartList[index], event: () {setState(() {});},);
                          },
                        ),
                      ),

                      caculate_total_money(voucher: voucher,),
                    ],
                  ),
                  onRefresh: _Refresh,
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
    );
  }
}
