import 'package:flutter/material.dart';

class image_of_product_detail extends StatefulWidget {
  final List<String> urls;
  const image_of_product_detail({super.key, required this.urls});

  @override
  State<image_of_product_detail> createState() => _image_of_product_detailState();
}

class _image_of_product_detailState extends State<image_of_product_detail> {
  int imageView = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              height: width - 20,
              decoration: widget.urls.isNotEmpty ? BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.urls[imageView]),
                ),
              ) : null,
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
                        width: width/4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: imageView == index ? Colors.red : Colors.transparent,
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

          Container(height: 10,),
        ],
      ),
    );
  }
}
