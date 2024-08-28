import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/signup_screen/mobile_signup_screen.dart';
import 'package:txhmmain/screen/pc_screen/signup_screen/pc_signup_screen.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? mobile_signup_screen() : pc_signup_screen();  }
}
