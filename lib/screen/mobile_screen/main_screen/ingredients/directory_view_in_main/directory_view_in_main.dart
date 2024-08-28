import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/otherdata/Tool.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';
import 'package:txhmmain/screen/mobile_screen/main_screen/ingredients/directory_view_in_main/item_product_in_directory_view_in_main.dart';
import '../../../../general_screen/directory_viewall_screen.dart';
import '../../../../ingredient/product_directory_drawer/product_directory_ingredient/directory_title/directory_title.dart';

class directory_view_in_main extends StatefulWidget {
  final String id;
  const directory_view_in_main({super.key, required this.id});

  @override
  State<directory_view_in_main> createState() => _directory_view_in_mainState();
}

class _directory_view_in_mainState extends State<directory_view_in_main> with AutomaticKeepAliveClientMixin {
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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          children: [
            directory_title(id: directory.id, name: directory.name, type: 1,),

            Container(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10,),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2, // khoảng cách giữa các hàng
                    crossAxisSpacing: 2, // khoảng cách giữa các cột
                    childAspectRatio: 2/3,
                  ),
                  itemCount: directory.productList.length <= 8 ? directory.productList.length : 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return item_product_in_directory_view_in_main(id: directory.productList[index]);
                  },
                ),
              ),
            ),

            Container(height: 2, decoration: BoxDecoration(color: Colors.transparent),),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, bottom: 10,),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => directory_viewall_screen(id: directory.id)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
