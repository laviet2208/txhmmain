import 'package:flutter/material.dart';
import 'package:txhmmain/screen/general_screen/checkout_screen.dart';
import 'package:txhmmain/screen/general_screen/main_screen.dart';
import '../../../../data/finalData.dart';
import '../../../../data/orderData/Order.dart';
import '../../../../data/orderData/Receiver.dart';
import '../../../../data/otherdata/Tool.dart';
import '../../../../data/voucherData/Voucher.dart';
import '../../../general_screen/utils/utils.dart';
import '../../../mobile_screen/cart_screen/ingredient/cost_text_line.dart';
import '../../../mobile_screen/cart_screen/ingredient/voucher_select/voucher_select.dart';

class caculate_total_money extends StatefulWidget {
  final Voucher voucher;
  const caculate_total_money({super.key, required this.voucher});

  @override
  State<caculate_total_money> createState() => _caculate_total_moneyState();
}

class _caculate_total_moneyState extends State<caculate_total_money> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),

            cost_text_line(title: 'Items (' + finalData.cartList.length.toString() + ')', content: getStringNumber(calculatetotalMoney()) + ' .VNĐ', size: width/110, contentColor: Colors.black, titleColor: Colors.grey,),

            SizedBox(height: 10,),

            GestureDetector(
              child: cost_text_line(title: 'Voucher', content: (widget.voucher.id == '' ? 'Chọn mã giảm giá' : ('- ' + getStringNumber(getVoucherSale(widget.voucher, calculatetotalMoney())) + ' .vnđ')), size: width/110, contentColor: Colors.blue, titleColor: Colors.grey,),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  barrierColor: Colors.white,
                  builder: (context) {
                    return voucher_select(voucher: widget.voucher, ontap: () {
                      setState(() {

                      });
                    }, cost: calculatetotalMoney());
                  },
                );
              },
            ),

            SizedBox(height: 10,),

            Container(
              height: 0.5,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 10,),

            cost_text_line(title: 'Tổng tiền', content: getStringNumber(calculatetotalMoney() - getVoucherSale(widget.voucher, calculatetotalMoney())) + ' .vnđ', size: width/110, contentColor: Colors.black, titleColor: Colors.black,),

            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // Đặt border radius là 10 đơn vị
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (finalData.cartList.isNotEmpty) {
                      Order order = Order(id: '', voucher: Voucher(id: '', Money: 0, mincost: 0, startTime: getCurrentTime(), endTime: getCurrentTime(), useCount: 0, maxCount: 0, eventName: '', type: 0, perCustom: 0, CustomList: [], maxSale: 0), note: '', productList: [], receiver: Receiver(name: '', nation: '', phoneNumber: '', city: '', district: '', podcode: '', province: '', address: ''), createTime: getCurrentTime(), status: '', owner: '');
                      order.productList = finalData.cartList;
                      order.voucher = widget.voucher;
                      order.receiver.name = finalData.account.firstName + ' ' + finalData.account.lastName;
                      order.receiver.phoneNumber = finalData.account.phoneNum;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => checkout_screen(order: order,)),);
                    } else {
                      toastMessage('Giỏ hàng của bạn đang trống');
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Tiếp tục check out',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.white,
                        fontSize: width/110,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey.withOpacity(0.5)),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), // Đặt border radius là 10 đơn vị
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => main_screen()),);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Tiếp tục mua hàng',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.black,
                        fontSize: width/110,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
