import 'package:flutter/material.dart';

import '../otherdata/Time.dart';

class ProductDirectory {
  String id;
  String name;
  int grade;
  int status;
  Time createTime;
  List<String> subList;
  List<String> productList;

  ProductDirectory({required this.id, required this.status, required this.name, required this.createTime, required this.grade, required this.subList, required this.productList});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'createTime': createTime.toJson(),
    'grade': grade,
    'name': name,
    'subList': subList.map((e) => e).toList(),
    'productList': productList.map((e) => e).toList(),
    'status': status,
  };

  factory ProductDirectory.fromJson(Map<dynamic, dynamic> json) {
    List<String> prdList = [];
    List<String> subList = [];

    if (json["productList"] != null) {
      for (final result in json["productList"]) {
        prdList.add(result.toString());
      }
    }

    if (json["subList"] != null) {
      for (final result in json["subList"]) {
        subList.add(result.toString());
      }
    }

    return ProductDirectory(
      id: json['id'].toString(),
      createTime: Time.fromJson(json['createTime']),
      name: json['name'].toString(),
      productList: prdList,
      grade: int.parse(json['grade'].toString()),
      subList: subList,
      status: int.parse(json['status'].toString()),
    );
  }
}