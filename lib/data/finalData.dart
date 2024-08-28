import 'package:txhmmain/data/Account/Account.dart';
import 'package:txhmmain/data/otherdata/Tool.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';

import 'cartData/CartData.dart';

class finalData {
  static List<ProductDirectory> directory_all = [];
  static int selectButton = 13;
  static int reloadTime = -1;
  static List<String> AdsUrls = [];
  static List<String> directoryListId = [];
  static bool isLogin = false;
  static List<Cartdata> cartList = [];
  static Account account = Account(id: '', username: '', password: '', address: '', createTime: getCurrentTime(), money: 0, firstName: '', lastName: '', phoneNum: '', lockstatus: 0, voucherList: []);
}