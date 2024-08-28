import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/cart_screen/check_out/check_out_screen.dart';
import 'package:txhmmain/screen/pc_screen/cart_screen/check_out/check_out_screen.dart';
import '../../data/orderData/Order.dart';

class checkout_screen extends StatefulWidget {
  final Order order;
  const checkout_screen({super.key, required this.order});

  @override
  State<checkout_screen> createState() => _checkout_screenState();
}

class _checkout_screenState extends State<checkout_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? check_out_screen(order: widget.order) : check_out_screen_pc(order: widget.order);
  }
}
