import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../../../data/product/Product.dart';
import '../../../../ingredient/product_directory_drawer/product_directory_ingredient/directory_title/directory_title.dart';
import 'item_product_in_directory_view_in_main.dart';

class sale_limit_view_in_main extends StatefulWidget {
  const sale_limit_view_in_main({super.key,});

  @override
  State<sale_limit_view_in_main> createState() => _sale_limit_view_in_mainState();
}

class _sale_limit_view_in_mainState extends State<sale_limit_view_in_main> with AutomaticKeepAliveClientMixin {
  List<Product> productList = [];

  void get_product_list() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productList").orderByChild('saleLimit/year').equalTo(2024).onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      data.forEach((key, value) {
        Product product = Product.fromJson(value);
        if (product.saleLimit.year != 0) {
          productList.add(product);
        }
      });
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_product_list();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          children: [
            directory_title(id: 'id', name: 'SALE CÓ THỜI HẠN', type: 1,),

            Container(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // số phần tử trên mỗi hàng
                    mainAxisSpacing: 2, // khoảng cách giữa các hàng
                    crossAxisSpacing: 2, // khoảng cách giữa các cột
                    childAspectRatio: 2/3,
                  ),
                  itemCount: productList.length <= 8 ? productList.length : 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return item_product_in_directory_view_in_main(id: productList[index].id);
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
                    productList.length <= 8 ? 'Đã hiển thị hết sản phẩm' : 'Xem thêm ' + (productList.length - 8).toString() + ' sản phẩm',
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.blueAccent,
                      fontSize: 11,
                    ),
                  ),
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
