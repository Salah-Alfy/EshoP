// ignore_for_file: unnecessary_null_comparison

import 'package:eshop/helper/hex_color_extention.dart';
import 'package:flutter/material.dart';

class ProductModel {
  late String name, desc, image, price, size, detail, productId;
  late Color color;
  ProductModel(
      {this.name = "",
      this.desc = "",
      this.image = "",
      this.price = "",
      this.color = Colors.black,
      this.size = "",
      this.detail = "",
      this.productId = ""});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    desc = map["descreption"];
    image = map["image"];
    price = map["price"];
    color = HexColor.fromHex(map["color"]);
    size = map["size"];
    detail = map["detail"];
    productId = map["productId"];
  }

  toJson() {
    return {
      "name": name,
      "descreption": desc,
      "image": image,
      "price": price,
      "color": color,
      "size": size,
      "detail": detail,
      "productId":productId
    };
  }
}
