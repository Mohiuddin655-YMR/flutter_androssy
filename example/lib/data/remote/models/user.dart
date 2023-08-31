import 'package:data_management/core.dart';
import 'package:flutter_andomie/core.dart';

class User extends Data {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? photo;

  User({
    super.id,
    super.timeMills,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.photo,
  });

  factory User.from(dynamic source) {
    return User(
      id: source.entityId,
      timeMills: source.entityTimeMills,
      name: source.entityValue("name"),
      email: source.entityValue("email"),
      password: source.entityValue("password"),
      phone: source.entityValue("phone"),
      photo: source.entityValue("photo"),
    );
  }

  @override
  Map<String, dynamic> get source {
    return super.source.attach({
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "photo": photo,
    });
  }
}
