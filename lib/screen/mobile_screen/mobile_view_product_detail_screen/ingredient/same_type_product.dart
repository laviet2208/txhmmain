import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/screen/mobile_screen/mobile_preview_screen/ingredient/directory_view_in_main/item_product_in_directory_view_in_main.dart';

class same_type_product extends StatefulWidget {
  final String productType;
  final String productId;
  const same_type_product({super.key, required this.productType, required this.productId});

  @override
  State<same_type_product> createState() => _same_type_productState();
}

class _same_type_productState extends State<same_type_product> {
  List<String> keyList = [];

  void get_product_list() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productList").orderByChild('productType').equalTo(widget.productType).limitToFirst(20).onChildAdded.listen((event) {
      final dynamic key = event.snapshot.key;
      if (key != null && !keyList.contains(key)) {
        if (widget.productId != key) {
          keyList.add(key.toString());
          setState(() {});
        }
      }
    });
    reference.child("productList").orderByChild('productType').equalTo(widget.productType).limitToFirst(20).onChildMoved.listen((event) {
      final dynamic key = event.snapshot.key;
      if (key != null && keyList.contains(key)) {
        keyList.remove(key);
        setState(() {});
      }
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
    double width = MediaQuery.of(context).size.width;
    double width1 = (MediaQuery.of(context).size.width - 20)/2 - 0.5;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 10,
          ),

          Container(
            height: 30,
            child: Row(
              children: [
                Container(width: 5, decoration: BoxDecoration(color: Colors.red),),

                Container(width: 10,),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5,),
                    child: AutoSizeText(
                      'Sản phẩm cùng loại',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                      ),
                    ),
                  ),
                ),

                Container(width: width/3,)
              ],
            ),
          ),

          Container(
            height: 10,
          ),

          Container(
            height: 28.6 + 18.7 + 18.7 + 10 + width1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: keyList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    item_product_in_directory_view_in_main(id: keyList[index]),
                  ],
                );
              },
            ),
          ),

          Container(
            height: 10,
          ),
        ],
      ),
    );
  }
}
