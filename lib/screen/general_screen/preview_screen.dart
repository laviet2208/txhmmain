import 'package:flutter/material.dart';

import '../mobile_screen/mobile_preview_screen/mobile_preview_screen.dart';
import '../pc_screen/pc_preview_screen.dart';

class preview_screen extends StatefulWidget {
  const preview_screen({super.key});

  @override
  State<preview_screen> createState() => _preview_screenState();
}

class _preview_screenState extends State<preview_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    bool isTablet = MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;
    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
    return isMobile ? mobile_preview_screen() : pc_preview_screen();
  }
}
