import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'index.dart';

class AppRouter {
  AppRouter._();

  static AppRouter get I => AppRouter._();

  List<String> ignoreRedirections = [
    '${AuthActivity.route}/:name',
  ];

  bool isRedirection(String? path) {
    return !ignoreRedirections.contains(path);
  }

  GoRouter get router => GoRouter(
    initialLocation: "${AuthActivity.route}/sign_in",
    errorBuilder: (context, state) {
      return const ErrorScreen();
    },
    //routerNeglect: true,
    redirect: (context, state) async {
      // if (kIsWeb && isRedirection(state.fullPath)) {
      //   final bool loggedIn = await di<AuthHandler>().isSignIn();
      //   if (!loggedIn) {
      //     return WelcomeActivity.route;
      //   }
      // }
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        name: AuthActivity.route,
        path: '${AuthActivity.route}/:name',
        builder: (context, state) {
          var type = state.pathParameters.getValue<String>("name");
          var back = state.uri.queryParameters.getValue<String>("back");
          return BlocProvider(
            create: (context) => di<CustomAuthController>(),
            child: AuthActivity(
              isFromWelcome: back.equals("true"),
              type: type.equals("sign_up")
                  ? AuthScreenType.signUp
                  : AuthScreenType.signIn,
            ),
          );
        },
      ),
      GoRoute(
        path: WelcomeActivity.route,
        builder: (context, state) {
          return const WelcomeActivity();
        },
      ),
      GoRoute(
        path: AboutsActivity.route,
        builder: (context, state) {
          var data = state.extra;
          return AboutsActivity(
            type: data.getValue<AboutScreenType>(
              key: "type",
              defaultValue: AboutScreenType.abouts,
            ),
          );
        },
      ),
      GoRoute(
        path: HomeActivity.route,
        builder: (context, state) {
          return const HomeActivity();
        },
      ),
    ],
  );
}

extension AppRouterPathExtension on String {
  String get withSlash => "/$this";

  String withParent(String parent) {
    return "/$parent/$this";
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "No screen found!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
