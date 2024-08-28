import 'package:firebase_database/firebase_database.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/data/otherdata/Tool.dart';
import 'package:txhmmain/data/product/ProductDirectory.dart';

class product_directory_drawer_controller {
  Future<List<ProductDirectory>> getAllDirectory() async {
    List<ProductDirectory> list = [];
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("productDirectory").once();
    final dynamic data = snapshot.snapshot.value;
    data.forEach((key, value) {
      ProductDirectory directory = ProductDirectory.fromJson(value);
      list.add(directory);
    });
    return list;
  }

  ProductDirectory getDirectoryById(String id) {
    ProductDirectory productDirectory = ProductDirectory(id: '', status: 0, name: '', createTime: getCurrentTime(), grade: 0, subList: [], productList: []);
    for (int i = 0; i < finalData.directory_all.length; i++) {
      if (finalData.directory_all[i].id == id) {
        productDirectory = finalData.directory_all[i];
        return productDirectory;
      }
    }
    return productDirectory;
  }
}