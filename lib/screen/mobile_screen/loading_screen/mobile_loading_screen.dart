import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:txhmmain/screen/mobile_screen/loading_screen/controller/loading_controller.dart';

class mobile_loading_screen extends StatefulWidget {
  const mobile_loading_screen({super.key});

  @override
  State<mobile_loading_screen> createState() => _mobile_loading_screenState();
}

class _mobile_loading_screenState extends State<mobile_loading_screen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    loading_controller.isLoginWeb(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFoldingCube(
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}
