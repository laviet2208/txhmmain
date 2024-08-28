import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../data/finalData.dart';
import '../cart_screen.dart';

class mobile_main_appbar extends StatelessWidget {
  final VoidCallback menuEvent;
  const mobile_main_appbar({super.key, required this.menuEvent});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 120,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 251, 215, 220),
      ),
      child: Column(
        children: [
          Container(
            height: 55,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/image/mainlogo.png'),
                )
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15,),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(width: 10,),

                    GestureDetector(
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: menuEvent,
                    ),

                    SizedBox(width: 10,),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10,),

                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Tìm kiếm sản phẩm...',
                                  style: TextStyle(
                                      fontFamily: 'muli',
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            Expanded(child: Container()),

                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20,
                            ),

                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 5,),

                    GestureDetector(
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                      onTap: () {
                        
                      },
                    ),

                    SizedBox(width: 5,),

                    GestureDetector(
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    finalData.cartList.length.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => cart_screen()),);
                      },
                    ),

                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );  }
}
