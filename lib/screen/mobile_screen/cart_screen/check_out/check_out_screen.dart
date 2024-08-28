import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/general_screen/appbar/general_app_bar.dart';
import '../../../../data/orderData/Order.dart';
import '../../../general_screen/appbar/mobile_preview_appbar.dart';
import '../../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import 'ingredient/item_product_in_checkout.dart';
import 'ingredient/total_money_check_out.dart';

class check_out_screen extends StatefulWidget {
  final Order order;
  const check_out_screen({super.key, required this.order,});

  @override
  State<check_out_screen> createState() => _check_out_screenState();
}

class _check_out_screenState extends State<check_out_screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _Refresh() async {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.order.receiver.name = (finalData.account.firstName != '' || finalData.account.lastName != '')  ? (finalData.account.firstName + ' ' + finalData.account.lastName) : '';
    widget.order.receiver.phoneNumber = finalData.account.phoneNum;
    widget.order.receiver.address = finalData.account.address;
    widget.order.receiver.nation = 'Việt Nam';
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
