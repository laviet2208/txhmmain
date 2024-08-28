import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/signin_screen/mobile_signin_screen.dart';
import 'package:txhmmain/screen/pc_screen/signin_screen/pc_signin_screen.dart';

class signin_screen extends StatefulWidget {
  const signin_screen({super.key});

  @override
  State<signin_screen> createState() => _signin_screenState();
}

class _signin_screenState extends State<signin_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? mobile_signin_screen() : pc_signin_screen();
  }
}
