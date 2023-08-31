import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_andomie/core.dart';

import '../../index.dart';

class UserPreference extends PreferenceHelper {
  UserPreference(
    super.preferences,
  );

  auth.User? get firebaseUser => auth.FirebaseAuth.instance.currentUser;

  User get user {
    var raw = getItem("uid");
    if (raw != null) {
      return User.from(raw);
    } else {
      return User(
        id: firebaseUser?.uid,
        name: firebaseUser?.displayName,
        email: firebaseUser?.email,
        phone: firebaseUser?.phoneNumber,
        photo: firebaseUser?.photoURL,
      );
    }
  }

  set user(User? user) => setItem("uid", user?.source);

  void setUser(User? user) => this.user = user;

  static auth.User? getFirebaseUser() => auth.FirebaseAuth.instance.currentUser;

  static User getUser([UserPreference? preference]) {
    var raw = preference?.getItem("uid");
    if (raw != null) {
      return User.from(raw);
    } else {
      var user = getFirebaseUser();
      return User(
        id: user?.uid,
        name: user?.displayName,
        email: user?.email,
        phone: user?.phoneNumber,
        photo: user?.photoURL,
      );
    }
  }
}
