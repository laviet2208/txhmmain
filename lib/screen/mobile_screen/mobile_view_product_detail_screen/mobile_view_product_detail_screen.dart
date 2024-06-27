import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:txhmmain/data/finalUnchangeData.dart';
import 'package:txhmmain/data/product/Product.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_view_product_detail_screen/ingredient/cost_and_status.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_view_product_detail_screen/ingredient/description_and_guild.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_view_product_detail_screen/ingredient/image_of_product_detail.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_view_product_detail_screen/ingredient/same_type_product.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_view_product_detail_screen/ingredient/top_product_name.dart';

import '../../../data/otherdata/Tool.dart';
import '../../general_screen/ingredient/preview_ingredient/bottom_page_mobile_decoration.dart';

class mobile_view_product_detail_screen extends StatefulWidget {
  final Product product;
  const mobile_view_product_detail_screen({super.key, required this.product});

  @override
  State<mobile_view_product_detail_screen> createState() => _mobile_view_product_detail_screenState();
}

class _mobile_view_product_detail_screenState extends State<mobile_view_product_detail_screen> {
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
              child: Container(
                height: height / (651 / 122),
                width: width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 215, 220),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      left: (width - (64 * (535 / 150))) / 2,
                      right: (width - (64 * (535 / 150))) / 2,
                      child: Container(
                        height: 64,
                        width: 64 * (535 / 150),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/mainlogo.png'),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 74,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: height / (651 / 40),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              child: Builder(
                                builder: (context) => GestureDetector(
                                  child: Container(
                                    width: height / (651 / 40),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                    ),
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: () => Scaffold.of(context).openDrawer(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              top: height / (651 / 122) + 5,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListView(
                    children: [
                      top_product_name(name: widget.product.name),

                      Container(height: 10,),

                      image_of_product_detail(urls: urls),

                      Container(height: 10,),

                      cost_and_status(product: widget.product),

                      Container(height: 10,),

                      description_and_guild(description: widget.product.description),

                      Container(height: 10,),

                      same_type_product(productType: widget.product.productType, productId: widget.product.id,),

                      Container(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: bottom_page_mobile_decoration(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
