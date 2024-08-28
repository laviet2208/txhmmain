import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../data/finalData.dart';
import '../../../../../data/orderData/Order.dart';
import 'update_note.dart';
import 'update_receiver_info.dart';

class receiver_info extends StatefulWidget {
  final Order order;
  const receiver_info({super.key, required this.order});

  @override
  State<receiver_info> createState() => _receiver_infoState();
}

class _receiver_infoState extends State<receiver_info> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/2.5;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          GestureDetector(
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: (width - 50)/3,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'Ship to',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.name == '' ? 'làm ơn thêm tên' : widget.order.receiver.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/50,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.district == '' ? 'Làm ơn thêm tên phường' : widget.order.receiver.district,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/50,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.city == '' ? 'Làm ơn thêm tên quận huyện' : widget.order.receiver.city,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/50,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.province == '' ? 'Làm ơn thêm tên tỉnh thành' : (widget.order.receiver.province + ' ' + widget.order.receiver.podcode),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/50,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.nation == '' ? 'Thêm tên quốc gia' : widget.order.receiver.nation,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/50,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.order.receiver.phoneNumber == '' ? 'Làm ơn thêm số điện thoại' : widget.order.receiver.phoneNumber,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width/50,
                                color: Colors.black,
                                fontFamily: 'muli',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return update_receiver_info(order: widget.order, event: () {setState(() {});},);
                },
              );
            },
          ),

          SizedBox(height: 10,),

          GestureDetector(
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: (width - 50)/3,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Note',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: width/50,
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Expanded(
                    child: Container(
                      child: Text(
                        widget.order.note == '' ? 'Click thêm ghi chú' : widget.order.note,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: width/50,
                          color: Colors.black,
                          fontFamily: 'muli',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return update_note(order: widget.order, event: () {setState(() {});},);
                },
              );
            },
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
