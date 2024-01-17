part of 'view.dart';

class Credential {
  final String? accountType;

  final String id;

  final String? name;

  final String? password;

  final String? profilePictureUri;
  final String? familyName;
  final String? givenName;

  Credential({
    required this.id,
    this.accountType,
    this.familyName,
    this.givenName,
    this.name,
    this.password,
    this.profilePictureUri,
  });

  Map<String, dynamic> toJson() => {
        'accountType': accountType,
        'id': id,
        'familyName': familyName,
        'givenName': givenName,
        'name': name,
        'password': password,
        'profilePictureUri': profilePictureUri,
      };

  factory Credential.fromJson(Map<String, dynamic> map) {
    return Credential(
      accountType: map['accountType'] as String?,
      id: map['id'] as String,
      familyName: map['familyName'] as String?,
      givenName: map['givenName'] as String?,
      name: map['name'] as String?,
      password: map['password'] as String?,
      profilePictureUri: map['profilePictureUri'] as String?,
    );
  }

  @override
  String toString() => toJson().toString();
}
