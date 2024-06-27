import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/otherdata/Tool.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_preview_screen/ingredient/directory_view_in_main/item_product_in_directory_view_in_main.dart';

import '../../../../../data/product/Product.dart';
import '../../../../ingredient/product_directory_ingredient/directory_title/directory_title.dart';

class directory_view_in_main extends StatefulWidget {
  final String id;
  const directory_view_in_main({super.key, required this.id});

  @override
  State<directory_view_in_main> createState() => _directory_view_in_mainState();
}

class _directory_view_in_mainState extends State<directory_view_in_main> {
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: getCurrentTime(), grade: 3, subList: [], productList: []);

  void get_directory_data() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productDirectory").child(widget.id).onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      directory = ProductDirectory.fromJson(data);
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_directory_data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          children: [
            directory_title(id: directory.id, name: directory.name,),

            Container(height: 5,),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // số phần tử trên mỗi hàng
                  mainAxisSpacing: 0.5, // khoảng cách giữa các hàng
                  crossAxisSpacing: 1, // khoảng cách giữa các cột
                  childAspectRatio: ((MediaQuery.of(context).size.width - 20)/2 - 0.5)/(28.6 + 18.7 + 18.7 + 10 + ((MediaQuery.of(context).size.width - 20)/2 - 0.5) - 10 + 5),
                ),
                // itemCount: productList.length,
                itemCount: directory.productList.length <= 8 ? directory.productList.length : 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return item_product_in_directory_view_in_main(id: directory.productList[index]);
                },
              ),
            ),

            Container(height: 5, decoration: BoxDecoration(color: Colors.white),),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white),
              child: GestureDetector(
                child: Text(
                  directory.productList.length <= 8 ? 'Đã hiển thị hết sản phẩm' : 'Xem thêm ' + (directory.productList.length - 8).toString() + ' sản phẩm',
                  style: TextStyle(
                    fontFamily: 'muli',
                    color: Colors.blueAccent,
                    fontSize: 11,
                  ),
                ),
              ),
            ),

            Container(height: 5, decoration: BoxDecoration(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
