import 'package:flutter/material.dart';
import 'package:txhmmain/data/product/Product.dart';
import 'package:txhmmain/screen/mobile_screen/product_detail_screen/mobile_product_detail_screen.dart';
import 'package:txhmmain/screen/pc_screen/pc_view_product_detail_screen/pc_view_product_detail_screen.dart';

class product_detail_screen extends StatefulWidget {
  final Product product;
  const product_detail_screen({super.key, required this.product});

  @override
  State<product_detail_screen> createState() => _product_detail_screenState();
}

class _product_detail_screenState extends State<product_detail_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? mobile_view_product_detail_screen(product: widget.product) : pc_view_product_detail_screen(product: widget.product);
  }
}
