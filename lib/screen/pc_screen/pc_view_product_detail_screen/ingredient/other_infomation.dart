import 'package:flutter/material.dart';
import 'package:txhmmain/data/product/Product.dart';
import 'package:txhmmain/screen/pc_screen/pc_view_product_detail_screen/ingredient/cost_and_status.dart';

class other_infomation extends StatefulWidget {
  final Product product;
  final List<String> urls;
  const other_infomation({super.key, required this.product, required this.urls});

  @override
  State<other_infomation> createState() => _other_infomationState();
}

class _other_infomationState extends State<other_infomation> {
  final GlobalKey _containerKey = GlobalKey();
  double _containerHeight = 0;
  int imageView = 0;

  void _getContainerHeight() {
    final RenderBox renderBox = _containerKey.currentContext!.findRenderObject() as RenderBox;
    setState(() {
      _containerHeight = renderBox.size.height;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getContainerHeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/2.5;
    double width1 = width/3 + 60;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: width1,
                  height: _containerHeight,
                  child: Column( // column này nhé
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: width1,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: width1 - 20,
                            decoration: widget.urls.isNotEmpty ? BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.urls[imageView]),
                              ),
                            ) : null,
                          ),
                        ),
                      ),

                      Container(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 60,
                          child: widget.urls.isNotEmpty ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.urls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  child: Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.5,
                                        color: imageView == index ? Colors.red : Colors.grey.withOpacity(0.5),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(widget.urls[index]),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      imageView = index;
                                    });
                                  },
                                ),
                              );
                            },
                          ): Container(),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(width: 10,),

                Expanded(
                  child: Container(
                    key: _containerKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        cost_and_status(product: widget.product),
                      ],
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
