import '../otherdata/Time.dart';

class ProductBrand {
  String id;
  String name;
  Time createTime;
  List<String> productList;

  ProductBrand({required this.id, required this.name, required this.createTime, required this.productList});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'createTime': createTime.toJson(),
    'name': name,
    'productList': productList.map((e) => e).toList(),
  };

  factory ProductBrand.fromJson(Map<dynamic, dynamic> json) {
    List<String> prdList = [];

    if (json["productList"] != null) {
      for (final result in json["productList"]) {
        prdList.add(result.toString());
      }
    }
    
    return ProductBrand(
      id: json['id'].toString(),
      createTime: Time.fromJson(json['createTime']),
      name: json['name'].toString(),
      productList: prdList,
    );
  }
}