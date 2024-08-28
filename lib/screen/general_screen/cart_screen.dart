import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/cart_screen/mobile_cart_screen.dart';
import 'package:txhmmain/screen/pc_screen/cart_screen/pc_cart_screen.dart';

class cart_screen extends StatefulWidget {
  const cart_screen({super.key});

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? mobile_cart_screen() : pc_cart_screen();
  }
}
