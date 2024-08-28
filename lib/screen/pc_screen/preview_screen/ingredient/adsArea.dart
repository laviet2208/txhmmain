import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../data/finalData.dart';

class adsArea extends StatefulWidget {
  const adsArea({super.key});

  @override
  State<adsArea> createState() => _adsAreaState();
}

class _adsAreaState extends State<adsArea> with AutomaticKeepAliveClientMixin {
  int index = 0;
  String url = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      index = index + 1;
      if (index == finalData.AdsUrls.length) {
        index = 0;
      }
      url = finalData.AdsUrls[index];
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width/2.5,
      height: width/5,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(url),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
