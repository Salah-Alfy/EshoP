// ignore_for_file: unnecessary_null_comparison


class UserModel {
  late String? userId, email, name;
  late String pic;
  UserModel({this.userId = "", this.email = "", this.name = "", this.pic = ""});

  UserModel.fromJson(Map<dynamic,dynamic> map) {
    if (map == null) {
      return;
    }

    userId = map["userId"];
    email = map["email"];
    name = map["name"];
    pic = map["pic"];
  }

  toJson() {
    return {"userId": userId, "email": email, "name": name, "pic": pic};
  }
}
