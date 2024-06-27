import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_view_product_detail_screen/mobile_view_product_detail_screen.dart';

import '../../../../../data/otherdata/Time.dart';
import '../../../../../data/otherdata/Tool.dart';
import '../../../../../data/product/Product.dart';

class item_product_in_directory_view_in_main extends StatefulWidget {
  final String id;
  const item_product_in_directory_view_in_main({super.key, required this.id});

  @override
  State<item_product_in_directory_view_in_main> createState() => _item_product_in_directory_view_in_mainState();
}

class _item_product_in_directory_view_in_mainState extends State<item_product_in_directory_view_in_main> {
  Product product = Product(id: '', name: 'VIÊN XẢ VẢI MÙI HƯƠNG HOA CỎ TƯƠI MÁT - DOWNY FRESH PROTECT IN-WASH ODOR DEFENSE SCENT BOOSTER BEADS, APRIL FRESH, 34 OZ', productType: '', showStatus: 0, createTime: getCurrentTime(), description: '', directoryList: [], cost: 845000, costBeforeSale: 1125000, inventory: 0, saleType: 1, productBrand: '', saleLimit: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), subdescription: '');
  String url = '';
  GlobalKey _containerKey = GlobalKey();
  bool _isRendered = false;
  double _containerHeight = 0.0;

  void get_product() {
    if (widget.id != '') {
      final reference = FirebaseDatabase.instance.ref();
      reference.child("productList").child(widget.id).onValue.listen((event) {
        final dynamic data = event.snapshot.value;
        product = Product.fromJson(data);
        _getImageURL('product/' + product.id + '/' + product.id + '_0.png');
        setState(() {

        });
      });
    }
  }

  void _getImageURL(String imagePath) async {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_product();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   if (_containerKey.currentContext != null) {
    //     final RenderBox renderBox = _containerKey.currentContext!.findRenderObject() as RenderBox;
    //     setState(() {
    //       _containerHeight = renderBox.size.height;
    //       print(_containerHeight);
    //       _isRendered = true;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 20)/2 - 0.5;
    return GestureDetector(
      child: Container(
        width: width,
        height: 28.6 + 18.7 + 18.7 + 10 + width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              url == '' ? Container(
                height: width - 10,
                alignment: Alignment.center,
                child: Icon(
                  Icons.image_outlined,
                  size: 25,
                ),
              ) : Container(
                height: width - 10,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(url),
                    )
                ),
                alignment: Alignment.center,
              ),

              Container(height: 5,),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(height: 5,),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.cost != 0 ? (getStringNumber(product.cost) + 'đ') : 'Liên hệ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  getStringNumber(product.costBeforeSale) + 'đ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: product.costBeforeSale == 0 ? 0 : 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mobile_view_product_detail_screen(product: product)),
        );
      },
    );
  }
}
