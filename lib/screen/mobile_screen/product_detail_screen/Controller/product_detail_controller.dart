import 'package:txhmmain/data/finalData.dart';

import '../../../../data/cartData/CartData.dart';
import '../../../../data/product/Product.dart';
import '../../../general_screen/utils/utils.dart';

class product_detail_controller {
  static void add_to_cart_handle(Product product, int number) {
    if (number > 0) {
      if (product.id != '') {
        bool check = true;
        for (Cartdata cartdata in finalData.cartList) {
          if (cartdata.product.id == product.id) {
            cartdata.number = cartdata.number + number;
            check = false;
            break;
          }
        }
        if (check) {
          finalData.cartList.add(Cartdata(product: product, number: number));
        }
        toastMessage('Thêm thành công');
      } else {
        toastMessage('Lỗi sản phẩm');
      }
    } else {
      toastMessage('Number must bigger than 0');
    }
  }
}