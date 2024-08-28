import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../data/finalUnchangeData.dart';

class logo_type_list extends StatelessWidget {
  const logo_type_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.pink,
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            top: 40,
            child: Container(
              child: ListView.builder(
                itemCount: finalUnchangeData.product_type_logo_url_list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      height: 140,
                      width: (MediaQuery.of(context).size.width - 40)/15,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(finalUnchangeData.product_type_logo_url_list[index]),
                                  )
                              ),
                            ),
                          ),

                          Positioned(
                            top: 100,
                            bottom: 0,
                            left: 10,
                            right: 10,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                finalUnchangeData.product_logo_name[index],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'muli',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              height: 20,
              child: AutoSizeText(
                'Danh mục sản phẩm',
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
