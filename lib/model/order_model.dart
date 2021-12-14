// ignore_for_file: unnecessary_null_comparison

import 'package:eshop/model/cart_product_model.dart';

class OrderModel {
  late String usrId, dateTime;
  late Adress adress;
  late List<CartProductModel> products;
  OrderModel({
    this.usrId = "",
    this.dateTime = "",
    required this.adress ,
    required this.products ,
  });

    OrderModel.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    usrId = map["usrId"];
    dateTime = map["dateTime"];
    adress = map["adress"];
    products = map["products"];
  }

  toMap() {
    return {
      "usrId": usrId,
      "dateTime": dateTime,
      "adress": adress,
      "products": products,
    };
  }

}

class Adress {
  late String street1, street2, city, state, country;

  Adress({
    this.street1 = "",
    this.street2 = "",
    this.city = "",
    this.state = "",
    this.country = "",
  });

  Adress.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    street1 = map["street1"];
    street2 = map["street2"];
    city = map["city"];
    state = map["state"];
    country = map["country"];
  }

  toMap() {
    return {
      "street1": street1,
      "street2": street2,
      "city": city,
      "state": state,
      "country": country
    };
  }
}
