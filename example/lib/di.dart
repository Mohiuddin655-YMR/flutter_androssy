import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'index.dart';

GetIt di = GetIt.instance;

Future<void> diInit() async {
  await _base();
  _user();
  _movie();
  _movieCategory();
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

void _movie() {
  /// DEMO PROJECT MODE ONLY
  /// USING TDD ARCHITECTURE
  di.registerLazySingleton<MovieSource>(() {
    return MovieSource();
  });

  di.registerLazySingleton<MovieRepository>(() {
    return MovieRepository(source: di());
  });

  di.registerLazySingleton<GetFreeForLimitedTimeMovies>(() {
    return GetFreeForLimitedTimeMovies(repository: di());
  });
  di.registerLazySingleton<GetLatestMovies>(() {
    return GetLatestMovies(repository: di());
  });
  di.registerLazySingleton<GetMostWatchedMovies>(() {
    return GetMostWatchedMovies(repository: di());
  });
  di.registerLazySingleton<GetPremiumMovies>(() {
    return GetPremiumMovies(repository: di());
  });
  di.registerLazySingleton<GetRecentWatchMovies>(() {
    return GetRecentWatchMovies(repository: di());
  });
  di.registerLazySingleton<GetShortMovies>(() {
    return GetShortMovies(repository: di());
  });
  di.registerLazySingleton<GetSpecificHeroVideos>(() {
    return GetSpecificHeroVideos(repository: di());
  });
  di.registerLazySingleton<GetTrailerVideos>(() {
    return GetTrailerVideos(repository: di());
  });
  di.registerFactory<MovieFreeController>(() {
    return MovieFreeController(get: di());
  });
  di.registerFactory<MovieLatestController>(() {
    return MovieLatestController(get: di());
  });
  di.registerFactory<MovieMostWatchedController>(() {
    return MovieMostWatchedController(get: di());
  });
  di.registerFactory<MoviePremiumController>(() {
    return MoviePremiumController(get: di());
  });
  di.registerFactory<MovieRecentWatchController>(() {
    return MovieRecentWatchController(get: di());
  });
  di.registerFactory<MovieShortController>(() {
    return MovieShortController(get: di());
  });
  di.registerFactory<MovieCarouselController>(() {
    return MovieCarouselController(get: di());
  });
  di.registerFactory<MovieTrailerController>(() {
    return MovieTrailerController(get: di());
  });

  /// REAL PROJECT MODE ONLY
  /// USING DATA MANAGEMENT (DATA ARCHITECTURE BASED) WITH CACHING MECHANISM
  // di.registerLazySingleton<MovieDataSource>(() {
  //   return MovieDataSource();
  // });
  //
  // di.registerLazySingleton<BackupMovieDataSource>(() {
  //   return BackupMovieDataSource();
  // });
  //
  // di.registerLazySingleton<RemoteDataRepository<Movie>>(() {
  //   return RemoteDataRepositoryImpl<Movie>(
  //     source: di<MovieDataSource>(),
  //     backup: di<BackupMovieDataSource>(),
  //     isCacheMode: true,
  //   );
  // });
  //
  // di.registerLazySingleton<RemoteDataHandler<Movie>>(() {
  //   return RemoteDataHandlerImpl<Movie>(repository: di());
  // });
  //
  // di.registerFactory<MovieDataController>(() => MovieDataController(di()));
}

void _movieCategory() {
  di.registerLazySingleton<MovieCategoryDataSource>(() {
    return MovieCategoryDataSource();
  });

  di.registerLazySingleton<BackupMovieCategoryDataSource>(() {
    return BackupMovieCategoryDataSource();
  });

  di.registerLazySingleton<RemoteDataRepository<MovieCategoryModel>>(() {
    return RemoteDataRepositoryImpl<MovieCategoryModel>(
      source: di<MovieCategoryDataSource>(),
      backup: di<BackupMovieCategoryDataSource>(),
      isCacheMode: true,
    );
  });

  di.registerLazySingleton<RemoteDataHandler<MovieCategoryModel>>(() {
    return RemoteDataHandlerImpl<MovieCategoryModel>(repository: di());
  });

  di.registerFactory<MovieCategoryDataController>(() {
    return MovieCategoryDataController(di());
  });
}
