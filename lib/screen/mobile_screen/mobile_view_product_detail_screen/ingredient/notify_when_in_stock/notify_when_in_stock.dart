import 'package:flutter/material.dart';
import 'package:txhmmain/data/otherdata/Tool.dart';
import 'package:txhmmain/data/product/Product.dart';
import 'package:txhmmain/screen/ingredient/textfield_type_2.dart';

class notify_when_in_stock extends StatefulWidget {
  final Product product;
  const notify_when_in_stock({super.key, required this.product});

  @override
  State<notify_when_in_stock> createState() => _notify_when_in_stockState();
}

class _notify_when_in_stockState extends State<notify_when_in_stock> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      insetPadding: EdgeInsets.only(left: width/15, right: width/15),
      contentPadding: EdgeInsets.only(top: 10, bottom: 10),
      titlePadding: EdgeInsets.only(left: 10, right: 10, top: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: Text(widget.product.name, style: TextStyle(fontFamily: 'muli', color: Colors.blueAccent, fontSize: 12),),
      content: Container(
        width: width - width/7.5,
        height: MediaQuery.of(context).size.height/4*3,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'muli',
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Giá dự kiến: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Để in đậm
                        ),
                      ),

                      TextSpan(
                        text: getStringNumber(widget.product.cost) + '.đ',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold, // Để in đậm
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(height: 15,),

              textfield_type_2(titleStyle: TextStyle(fontFamily: 'muli', color: Colors.red, fontSize: 10), hintStyle: TextStyle(fontFamily: 'muli', color: Colors.grey, fontSize: 13), readOnly: false, maxLine: 1, onchange: () {}, textfieldHeight: 35, title: 'Họ và tên', hint: 'Nhập họ tên của bạn(bắt buộc)', controller: nameController, edittextStyle: TextStyle(fontFamily: 'muli', color: Colors.black, fontSize: 13)),

              Container(height: 15,),

              textfield_type_2(titleStyle: TextStyle(fontFamily: 'muli', color: Colors.red, fontSize: 10), hintStyle: TextStyle(fontFamily: 'muli', color: Colors.grey, fontSize: 13), readOnly: false, maxLine: 1, onchange: () {}, textfieldHeight: 35, title: 'Số điện thoại', hint: 'Nhập số điện thoại của bạn(bắt buộc)', controller: phoneController, edittextStyle: TextStyle(fontFamily: 'muli', color: Colors.black, fontSize: 13)),

              Container(height: 15,),

              textfield_type_2(titleStyle: TextStyle(fontFamily: 'muli', color: Colors.red, fontSize: 10), hintStyle: TextStyle(fontFamily: 'muli', color: Colors.grey, fontSize: 13), readOnly: false, maxLine: 1, onchange: () {}, textfieldHeight: 35, title: 'Địa chỉ', hint: 'Nhập địa chỉ của bạn(bắt buộc)', controller: addressController, edittextStyle: TextStyle(fontFamily: 'muli', color: Colors.black, fontSize: 13)),

              Container(height: 15,),

              textfield_type_2(titleStyle: TextStyle(fontFamily: 'muli', color: Colors.red, fontSize: 10), hintStyle: TextStyle(fontFamily: 'muli', color: Colors.grey, fontSize: 13), readOnly: false, maxLine: 1, onchange: () {}, textfieldHeight: 35, title: 'Email', hint: 'Nhập email của bạn(bắt buộc)', controller: emailController, edittextStyle: TextStyle(fontFamily: 'muli', color: Colors.black, fontSize: 13)),

              Container(height: 15,),

              textfield_type_2(titleStyle: TextStyle(fontFamily: 'muli', color: Colors.red, fontSize: 10), hintStyle: TextStyle(fontFamily: 'muli', color: Colors.grey, fontSize: 13), readOnly: false, maxLine: 1, onchange: () {}, textfieldHeight: 35, title: 'Ghi chú', hint: 'Nhập ghi chú', controller: noteController, edittextStyle: TextStyle(fontFamily: 'muli', color: Colors.black, fontSize: 13)),

              Container(height: 15,),

              GestureDetector(
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'muli',
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'BÁO VỚI TÔI KHI CÓ HÀNG',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Để in đậm
                            ),
                          ),

                          TextSpan(
                            text: '\n(TƯ VẤN VIÊN SẼ BÁO VỚI QUÍ KHÁCH NGAY KHI CÓ HÀNG)',
                            style: TextStyle(
                              fontWeight: FontWeight.normal, // Để in đậm
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
