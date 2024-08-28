import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';

import '../../../../data/cartData/CartData.dart';
import '../../../../data/otherdata/Tool.dart';
import 'change_number.dart';

class item_cart_pc extends StatefulWidget {
  final Cartdata cartdata;
  final VoidCallback event;
  const item_cart_pc({super.key, required this.cartdata, required this.event});

  @override
  State<item_cart_pc> createState() => _item_cart_pcState();
}

class _item_cart_pcState extends State<item_cart_pc> {
  String url = '';
  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('product').child(widget.cartdata.product.id).child(widget.cartdata.product.id + '_0.png');
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageURL();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/2.5;
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(width: 10,),

                Container(
                  width: (width - 30)/5,
                  height: (width - 30)/5,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: url != '' ?  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url, fit: BoxFit.fitHeight,),
                    ) : null,
                  ),
                ),

                SizedBox(width: 10,),

                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 15,),

                        SizedBox(height: 5,),

                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.cartdata.product.name,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width/50,
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                'Number',
                                style: TextStyle(
                                  fontFamily: 'muli',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              SizedBox(width: 10,),

                              Container(
                                width: width/6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.black,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.cartdata.number.toString(),
                                    style: TextStyle(
                                      fontFamily: 'muli',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getStringNumber(widget.cartdata.product.cost) + ' .vnđ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width/40,
                            ),
                          ),
                        ),

                        SizedBox(height: 4,),

                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getStringNumber(widget.cartdata.product.costBeforeSale) + ' .vnđ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.normal,
                              fontSize: width/50,
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10,),
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    finalData.cartList.remove(widget.cartdata);
                    widget.event();
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return change_cart_number(cartdata: widget.cartdata, event: () {setState(() {});});
                      },
                    );
                  },
                  child: Text(
                    'Change number',
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
