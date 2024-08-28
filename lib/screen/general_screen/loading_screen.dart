import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/loading_screen/mobile_loading_screen.dart';

class loading_screen extends StatefulWidget {
  const loading_screen({super.key});

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? mobile_loading_screen() : mobile_loading_screen();
  }
}
