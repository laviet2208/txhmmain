import 'package:txhmmain/data/finalUnchangeData.dart';
import 'package:flutter/material.dart';

class main_type_product extends StatelessWidget {
  const main_type_product({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10,),
      child: Container(
        height: (((width - 40 - 20)/2)/(252/181))*2 + 50,
        width: width - 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số lượng item trên mỗi hàng
            crossAxisSpacing: 20.0, // Khoảng cách ngang giữa các item
            mainAxisSpacing: 10.0, // Khoảng cách dọc giữa các item
            childAspectRatio: 252/181,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              width: (width - 40 - 20)/2,
              height: ((width - 20 - 20)/2)/(252/181),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(finalUnchangeData.product_type_url_list[index]),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
