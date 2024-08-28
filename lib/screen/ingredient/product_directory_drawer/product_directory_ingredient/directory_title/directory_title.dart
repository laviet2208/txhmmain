import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../general_screen/directory_viewall_screen.dart';

class directory_title extends StatelessWidget {
  final String id;
  final String name;
  final int type;
  const directory_title({super.key, required this.id, required this.name, required this.type});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/3;
    return Container(
      height: 30,
      decoration: BoxDecoration(

      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  children: [
                    Container(width: 5, decoration: BoxDecoration(color: Colors.red),),

                    Container(width: 10,),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5,),
                        child: AutoSizeText(
                          name,
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

                    Container(width: 10,),

                    type == 1 ? Padding(
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                      child: TextButton(
                        child: AutoSizeText(
                          'Xem tất cả',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 100,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => directory_viewall_screen(id: id)),
                          );
                        },
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
