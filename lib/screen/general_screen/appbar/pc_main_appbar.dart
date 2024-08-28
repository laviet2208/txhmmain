import 'package:flutter/material.dart';

import '../cart_screen.dart';

class pc_main_appbar extends StatefulWidget {
  final VoidCallback openDirectory;
  const pc_main_appbar({super.key, required this.openDirectory});

  @override
  State<pc_main_appbar> createState() => _pc_main_appbarState();
}

class _pc_main_appbarState extends State<pc_main_appbar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double height1 = height/13;
    return Container(
      height: height/13,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 251, 215, 220),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: GestureDetector(
              child: Container(
                width: width/7,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 4, 207, 30),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        width: height1 - 20,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.3, color: Colors.white,),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: height1 - 28,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            'Danh mục sản phẩm',
                            style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: widget.openDirectory,
            ),
          ),

          SizedBox(width: 20,),

          Container(
            height: height/13,
            width: (height/13) * (535/150),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/mainlogo.png'),
              ),
            ),
          ),

          SizedBox(width: 20,),

          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              width: width/7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),

                  Container(
                    width: width/7 - 50,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tìm kiếm',
                      style: TextStyle(
                        fontFamily: 'muli',
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(width: 10,),
                ],
              ),
            ),
          ),

          SizedBox(width: 20,),

          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Tư vấn trực tuyến',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Để in đậm
                    ),
                  ),

                  TextSpan(
                    text: '\n0939.73.5858',
                    style: TextStyle(
                      fontWeight: FontWeight.normal, // Để in đậm
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 20,),

          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10,),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontFamily: 'muli',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 20,),

          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 4, 207, 30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 5,),

                  Container(
                    width: 20,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),

                  SizedBox(width: 5,),

                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'muli',
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Giỏ hàng ',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                            TextSpan(
                              text: '(0)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => cart_screen()),);
                    },
                  ),

                  SizedBox(width: 5,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
