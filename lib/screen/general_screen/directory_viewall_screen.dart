import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/viewall_screen/directory_viewall_screen.dart';
import 'package:txhmmain/screen/pc_screen/viewall_screen/directory_viewall_screen.dart';

class directory_viewall_screen extends StatefulWidget {
  final String id;
  const directory_viewall_screen({super.key, required this.id});

  @override
  State<directory_viewall_screen> createState() => _directory_viewall_screenState();
}

class _directory_viewall_screenState extends State<directory_viewall_screen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;
    return isMobile ? mobile_directory_viewall_screen(id: widget.id) : pc_directory_viewall_screen(id: widget.id);
  }
}
