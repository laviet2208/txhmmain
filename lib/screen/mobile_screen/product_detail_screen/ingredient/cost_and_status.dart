import 'package:flutter/material.dart';
import '../../../../data/otherdata/Tool.dart';
import '../../../../data/product/Product.dart';
import '../Controller/product_detail_controller.dart';
import 'notify_when_in_stock/notify_when_in_stock.dart';

class cost_and_status extends StatefulWidget {
  final Product product;
  const cost_and_status({super.key, required this.product});

  @override
  State<cost_and_status> createState() => _cost_and_statusState();
}

class _cost_and_statusState extends State<cost_and_status> {
  int numberProduct = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.product.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Container(height: 5,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'muli',
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Mã Sp: ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal, // Để in đậm
                      ),
                    ),

                    TextSpan(
                      text: widget.product.id,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Để in đậm
                      ),
                    ),

                    TextSpan(
                      text: '    Tình trạng: ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal, // Để in đậm
                      ),
                    ),

                    TextSpan(
                      text: (widget.product.inventory != 0 || widget.product.saleType == 2) ? 'Còn hàng' : 'Hết hàng',
                      style: TextStyle(
                        color: (widget.product.inventory != 0 || widget.product.saleType == 2) ? Colors.black : Colors.red,
                        fontWeight: FontWeight.bold, // Để in đậm
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 0.3,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 247, 247),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        widget.product.cost != 0 ? (getStringNumber(widget.product.cost) + 'đ') : 'Liên hệ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'muli',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      Container(width: 10,),

                      Text(
                        widget.product.costBeforeSale != 0 ? (getStringNumber(widget.product.costBeforeSale) + 'đ') : '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'muli',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),

                      Container(width: 10,),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Center(
                                child: Text(
                                  (widget.product.cost != 0 && widget.product.costBeforeSale != 0) ? ('Giảm ' + (100 - (widget.product.cost/widget.product.costBeforeSale)*100).toStringAsFixed(0) + '%') : '',
                                  style: TextStyle(
                                    fontFamily: 'muli',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(width: width/7,),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sale đến hết ngày ' + getDayTimeString(widget.product.saleLimit),
                style: TextStyle(
                  fontSize: widget.product.saleLimit.year == 0 ? 0 : 12,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Số lượng: ',
                  style: TextStyle(
                    fontSize: widget.product.saleLimit.year == 0 ? 0 : 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.remove, size: 14,),
                  onPressed: () => setState(() {
                    final newValue = numberProduct - 1;
                    numberProduct = newValue.clamp(1, 100);
                  }),
                ),

                Text(numberProduct.toString()),

                IconButton(
                  icon: Icon(Icons.add, size: 14,),
                  onPressed: () => setState(() {
                    final newValue = numberProduct + 1;
                    numberProduct = newValue.clamp(1, 100);
                  }),
                ),
              ],
            ),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: (widget.product.inventory != 0 || widget.product.saleType == 2) ? GestureDetector(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 0.5,
                    color: Colors.red,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Thêm vào giỏ hàng',
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                product_detail_controller.add_to_cart_handle(widget.product, numberProduct);
              },
            ) : Container(height: 0,),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: (widget.product.inventory != 0 || widget.product.saleType == 2) ? Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  width: 0.5,
                  color: Colors.red,
                ),
              ),
              child: Center(
                child: Text(
                  'Mua ngay',
                  style: TextStyle(
                    fontFamily: 'muli',
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ) : Container(),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              child: !(widget.product.inventory != 0 || widget.product.saleType == 2) ? Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 0.5,
                    color: Color.fromARGB(255, 53, 126, 189),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Báo khi có hàng',
                    style: TextStyle(
                      fontFamily: 'muli',
                      color: Color.fromARGB(255, 53, 126, 189),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ) : Container(height: 0,),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return notify_when_in_stock(product: widget.product);
                  },
                );
              },
            ),
          ),

          Container(height: 10,),
        ],
      ),
    );
  }
}

