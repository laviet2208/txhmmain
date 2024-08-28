import 'package:firebase_database/firebase_database.dart';

import '../../../../data/otherdata/Tool.dart';
import '../../../../data/product/ProductDirectory.dart';

class viewall_controller {
  static Future<ProductDirectory> get_directory_data(String id) async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("productDirectory").child(id).once();
    final dynamic data = snapshot.snapshot.value;
    print(data.toString());
    ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: getCurrentTime(), grade: 3, subList: [], productList: []);
    directory = ProductDirectory.fromJson(data);
    return directory;
  }
}