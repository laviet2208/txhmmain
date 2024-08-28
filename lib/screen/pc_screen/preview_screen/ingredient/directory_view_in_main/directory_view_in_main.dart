import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/otherdata/Tool.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';
import '../../../../ingredient/product_directory_drawer/product_directory_ingredient/directory_title/directory_pc_title.dart';
import 'item_product_in_directory_view_in_main.dart';

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
            directory_pc_title(id: directory.id, name: directory.name, type: 1,),

            Container(height: 5,),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // số phần tử trên mỗi hàng
                  mainAxisSpacing: 0, // khoảng cách giữa các hàng
                  crossAxisSpacing: 0, // khoảng cách giữa các cột
                  childAspectRatio: ((MediaQuery.of(context).size.width)/10)/(28.6 + 18.7 + 18.7 + 10 + ((MediaQuery.of(context).size.width)/10) - 10 + 25),
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
