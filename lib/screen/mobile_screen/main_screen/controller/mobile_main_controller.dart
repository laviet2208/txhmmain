import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class mobile_main_controller {
  static Future<List<String>> getAllImageURL(String imagePath) async {
    final ListResult result = await FirebaseStorage.instance.ref(imagePath).listAll();
    final List<Reference> allFiles = result.items;
    List<String> urls = [];
    for (Reference file in allFiles) {
      final String downloadUrl = await file.getDownloadURL();
      urls.add(downloadUrl);
    }
    return urls;
  }

  static Future<List<String>> getDirectoryList() async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("UiManager").once();
    final dynamic data = snapshot.snapshot.value;
    List<String> directoryList = [];
    for (final result in data["mainUI"]) {
      directoryList.add(result.toString());
      print(result.toString());
    }
    return directoryList;
  }
}