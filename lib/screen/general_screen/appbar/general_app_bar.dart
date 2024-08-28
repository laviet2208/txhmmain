import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/general_screen/appbar/mobile_main_appbar.dart';
import 'package:txhmmain/screen/general_screen/appbar/mobile_preview_appbar.dart';
import 'package:txhmmain/screen/general_screen/appbar/pc_main_appbar.dart';
import 'package:txhmmain/screen/general_screen/appbar/pc_preview_app_bar.dart';

class general_app_bar extends StatefulWidget {
  final VoidCallback event;
  const general_app_bar({super.key, required this.event});

  @override
  State<general_app_bar> createState() => _general_app_barState();
}

class _general_app_barState extends State<general_app_bar> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? (finalData.account.id == '' ? mobile_preview_appbar(menuEvent: widget.event) : mobile_main_appbar(menuEvent: widget.event))
        : (finalData.account.id == '' ? preview_app_bar(openDirectory: widget.event) : pc_main_appbar(openDirectory: widget.event));
  }
}
