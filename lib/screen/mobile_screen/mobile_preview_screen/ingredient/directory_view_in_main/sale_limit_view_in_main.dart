import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_preview_screen/ingredient/directory_view_in_main/item_product_in_directory_view_in_main.dart';
import '../../../../../data/product/Product.dart';
import '../../../../ingredient/product_directory_ingredient/directory_title/directory_title.dart';

class sale_limit_view_in_main extends StatefulWidget {
  const sale_limit_view_in_main({super.key,});

  @override
  State<sale_limit_view_in_main> createState() => _sale_limit_view_in_mainState();
}

class _sale_limit_view_in_mainState extends State<sale_limit_view_in_main> {
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
            directory_title(id: 'id', name: 'SALE CÓ THỜI HẠN',),

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
                itemCount: productList.length <= 8 ? productList.length : 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return item_product_in_directory_view_in_main(id: productList[index].id);
                },
              ),
            ),

            Container(height: 5, decoration: BoxDecoration(color: Colors.white),),

            Container(
              alignment: Alignment.center,
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

            Container(height: 5, decoration: BoxDecoration(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
