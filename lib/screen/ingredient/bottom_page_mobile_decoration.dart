import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class bottom_page_mobile_decoration extends StatelessWidget {
  const bottom_page_mobile_decoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10,),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 35,
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/other_image/medal.png'),
                          )
                      ),
                    ),

                    Container(width: 30,),

                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'Cam kết chất lượng',
                              style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 15,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 35,
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/other_image/safety.png'),
                          )
                      ),
                    ),

                    Container(width: 30,),

                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'Sản phẩm an toàn',
                              style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 15,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 35,
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/other_image/refund.png'),
                          )
                      ),
                    ),

                    Container(width: 30,),

                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'Hàng chính hãng Mỹ',
                              style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 15,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 35,
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/other_image/truck.png'),
                          )
                      ),
                    ),

                    Container(width: 30,),

                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'Giao hàng nhanh chóng',
                              style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 30,),

            Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),

            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: (MediaQuery.of(context).size.width - 60)/(535/150),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/mainlogo.png'),
                    )
                ),
              ),
            ),

            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Tại Việt Nam:',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'muli',
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Hotline: 0939.73.5858',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'muli',
                  ),
                ),
              ),
            ),

            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Tại Mỹ:',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'muli',
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Địa chỉ: Houston-Texas',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'muli',
                  ),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Hotline: 832.805.9695 (Mr.Alex)',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'muli',
                  ),
                ),
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 20,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Email: thy.nguyen1901@gmail.com',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'muli',
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
