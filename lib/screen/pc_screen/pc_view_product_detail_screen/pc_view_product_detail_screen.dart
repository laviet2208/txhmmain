import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/pc_screen/pc_view_product_detail_screen/ingredient/description_and_guild.dart';
import 'package:txhmmain/screen/pc_screen/pc_view_product_detail_screen/ingredient/other_infomation.dart';
import '../../../data/product/Product.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../mobile_screen/product_detail_screen/ingredient/top_product_name.dart';

class pc_view_product_detail_screen extends StatefulWidget {
  final Product product;
  const pc_view_product_detail_screen({super.key, required this.product});

  @override
  State<pc_view_product_detail_screen> createState() => _pc_view_product_detail_screenState();
}

class _pc_view_product_detail_screenState extends State<pc_view_product_detail_screen> {
  int tabSelect = 1;
  int imageView = 0;
  List<String> urls = [];

  void _getImageURL(String imagePath) async {
    final ListResult result = await FirebaseStorage.instance.ref(imagePath).listAll();
    final List<Reference> allFiles = result.items;

    for (Reference file in allFiles) {
      final String downloadUrl = await file.getDownloadURL();
      urls.add(downloadUrl);
      setState(() {

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageURL('product/' + widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 248, 249),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: general_app_bar(event: () {}),
            ),

            Positioned(
              top: height/13,
              left: width/3,
              bottom: 0,
              child: Container(
                width: width/2.5,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(height: 10,),

                    top_product_name(name: widget.product.name),

                    Container(height: 10,),

                    other_infomation(product: widget.product, urls: urls,),

                    Container(height: 10,),

                    description_and_guild(description: widget.product.description),

                    Container(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
