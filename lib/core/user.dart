part of '../core.dart';

class AndrossyUser {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? photo;

  const AndrossyUser({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.photo,
  });

  factory AndrossyUser.from(Map<String, dynamic> source) {
    var uid = source["uid"];
    var name = source["name"];
    var email = source["email"];
    var password = source["password"];
    var phone = source["phone"];
    var photo = source["photo"];
    return AndrossyUser(
      uid: uid is String ? uid : null,
      name: name is String ? name : null,
      email: email is String ? email : null,
      password: password is String ? password : null,
      phone: phone is String ? phone : null,
      photo: photo is String ? photo : null,
    );
  }

  Map<String, dynamic> get source {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "photo": photo,
    };
  }
}
