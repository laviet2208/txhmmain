import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/data/product/Product.dart';
import 'package:txhmmain/screen/general_screen/appbar/mobile_main_appbar.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../ingredient/bottom_page_mobile_decoration.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import '../../general_screen/appbar/mobile_preview_appbar.dart';
import 'ingredient/cost_and_status.dart';
import 'ingredient/description_and_guild.dart';
import 'ingredient/image_of_product_detail.dart';
import 'ingredient/same_type_product.dart';
import 'ingredient/top_product_name.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
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
              child: general_app_bar(event: () => _scaffoldKey.currentState?.openDrawer(),),
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
      drawer: Drawer(
        width: width / (394 / 286),
        // child: type_drawer(),
        child: product_directory_drawer(),
      ),
    );
  }
}
