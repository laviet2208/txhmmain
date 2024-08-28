import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/general_screen/preview_screen.dart';
import 'package:txhmmain/screen/mobile_screen/main_screen/mobile_main_screen.dart';
import 'package:txhmmain/screen/pc_screen/preview_screen/pc_preview_screen.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? (finalData.account.id != '' ? mobile_main_screen() : preview_screen()) : pc_preview_screen();
  }
}
