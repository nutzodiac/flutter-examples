import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/navigator_service.dart';
import '../module/login/view/login_page.dart';
import '../module/mock/view/mock_page.dart';
import '../module/splash/view/splash_page.dart';

class MyRouter {
  static final GoRouter build = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'mock/:tab',
            builder: (BuildContext context, GoRouterState state) {
              final tabIndex = state.pathParameters['tab']!;
              return MockPage(setTab: int.parse(tabIndex));
            },
          ),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
        ],
      ),
    ],
  );
}

void popUntil(String path) {
  while (GoRouter.of(NavigationService.navigatorKey.currentContext!).canPop()) {
    GoRouter.of(NavigationService.navigatorKey.currentContext!).pop();
  }
  NavigationService.navigatorKey.currentContext!.pushReplacement(path);
}