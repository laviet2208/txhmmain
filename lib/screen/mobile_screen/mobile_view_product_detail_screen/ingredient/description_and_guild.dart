import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../data/finalUnchangeData.dart';

class description_and_guild extends StatefulWidget {
  final String description;
  const description_and_guild({super.key, required this.description});

  @override
  State<description_and_guild> createState() => _description_and_guildState();
}

class _description_and_guildState extends State<description_and_guild> {
  int tabSelect = 1;

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

          Container(
            height: 30,
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                      width: width/4,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: tabSelect == 1 ? Colors.red : Colors.white,
                              )
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Center(
                            child: Text(
                              'Mô tả',
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  onTap: () {
                    setState(() {
                      tabSelect = 1;
                    });
                  },
                ),

                Container(width: 20,),

                Expanded(
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: tabSelect == 2 ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Center(
                            child: Text(
                              'Hướng dẫn mua hàng',
                              style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        tabSelect = 2;
                      });
                    },
                  ),
                ),

                Container(width: 20,),
              ],
            ),
          ),

          Container(height: 10,),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: HtmlWidget(
                tabSelect == 1 ? widget.description : finalUnchangeData.huongdanmuahangHTML,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
