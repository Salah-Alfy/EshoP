// ignore_for_file: unnecessary_null_comparison

class CartProductModel {
  late String name, image, price,productId;
  late int quantity;
  CartProductModel(
      {this.name = "",
      this.image = "",
      this.price = "",
      this.productId = "",
      this.quantity =1
});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    image = map["image"];
    price = map["price"];
    productId = map["productId"];
    quantity = map["quantity"];
  }

  toJson() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "productId": productId,
      "quantity": quantity,
    };
  }
}