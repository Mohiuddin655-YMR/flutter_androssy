import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'index.dart';

GetIt di = GetIt.instance;

Future<void> diInit() async {
  await _base();
  _user();
  await di.allReady();
}

Future<void> _base() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => preferences);
  di.registerLazySingleton<UserPreference>(() => UserPreference(di()));
}

void _user() {
  di.registerLazySingleton<UserDataSource>(() {
    return UserDataSource();
  });

  di.registerLazySingleton<RemoteDataRepository<User>>(() {
    return RemoteDataRepositoryImpl<User>(source: di<UserDataSource>());
  });

  di.registerLazySingleton<RemoteDataHandler<User>>(() {
    return RemoteDataHandlerImpl<User>(repository: di());
  });

  di.registerFactory<UserController>(() => UserController(di()));
}
