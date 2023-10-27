import 'package:flutter/material.dart';
import 'package:flutter_app_navigator/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class AppRouter extends AppRouteGenerator {
  const AppRouter._();

  static AppRouter get I => const AppRouter._();

  @override
  AppRouteConfig get config {
    return const AppRouteConfig(
      animationTime: 700,
    );
  }

  @override
  Map<String, RouteBuilder> routes() {
    return {
      SplashScreens.route: splash,
      MainScreens.route: main,
      SeeAllScreens.route: seeAll,
      SubscriptionScreens.route: subscription,
      PlayerScreens.route: player,
    };
  }

  @override
  Widget onDefault(BuildContext context, Object? data) => main(context, data);

  Widget main(BuildContext context, Object? data) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<MovieFreeController>()..fetch()),
        BlocProvider(create: (_) => di<MovieLatestController>()..fetch()),
        BlocProvider(create: (_) => di<MovieMostWatchedController>()..fetch()),
        BlocProvider(create: (_) => di<MoviePremiumController>()..fetch()),
        BlocProvider(create: (_) => di<MovieRecentWatchController>()..fetch()),
        BlocProvider(create: (_) => di<MovieShortController>()..fetch()),
        BlocProvider(create: (_) => di<MovieCarouselController>()..fetch()),
        BlocProvider(create: (_) => di<MovieTrailerController>()..fetch()),
      ],
      child: const MainActivity(),
    );
  }

  Widget subscription(BuildContext context, Object? data) {
    return SubscriptionActivity(
      data: data("data", Video()),
    );
  }

  Widget player(BuildContext context, Object? data) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<MovieLatestController>()..fetch()),
      ],
      child: PlayerActivity(
        data: data("data", Video()),
      ),
    );
  }

  Widget seeAll(BuildContext context, Object? data) {
    return SeeAllActivity(
      category: data("category", ""),
    );
  }

  Widget splash(BuildContext context, Object? data) {
    return const SplashActivity();
  }
}
