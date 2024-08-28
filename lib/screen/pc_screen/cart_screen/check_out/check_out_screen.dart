import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/general_screen/appbar/general_app_bar.dart';
import '../../../../data/orderData/Order.dart';
import '../../../general_screen/appbar/mobile_preview_appbar.dart';
import '../../../ingredient/bottom_page_pc_decoration.dart';
import '../../../ingredient/other_decoration/messenger.dart';
import '../../../ingredient/other_decoration/telephone.dart';
import '../../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'ingredient/item_product_in_checkout.dart';
import 'ingredient/total_money_check_out.dart';

class check_out_screen_pc extends StatefulWidget {
  final Order order;
  const check_out_screen_pc({super.key, required this.order,});

  @override
  State<check_out_screen_pc> createState() => _check_out_screen_pcState();
}

class _check_out_screen_pcState extends State<check_out_screen_pc> {
  bool isOpen = true;

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
                            'Đơn của bạn (' + finalData.cartList.length.toString() + ' món)',
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
                          itemCount: widget.order.productList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return item_product_in_checkout(cartdata: widget.order.productList[index]);
                          },
                        ),
                      ),

                      total_money_check_out(order: widget.order),

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
        return true;
      },
    );
  }
}
