import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wenia_test/features/authentication/presentation/presentation.dart';
import 'package:wenia_test/features/comparison/presentation/presentation.dart';
import 'package:wenia_test/features/favorites/presentation/presentation.dart';
import 'package:wenia_test/features/home/presentation/presentation.dart';
import 'package:wenia_test/features/list/presentation/presentation.dart';
import 'package:wenia_test/features/profile/presentation/presentation.dart';

class AppRouter {
  static GoRouter createRouter() {
    final GlobalKey<NavigatorState> parentKey = GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> shellListNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'home');
    final GlobalKey<NavigatorState> shellFavoritesNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'favorites');
    final GlobalKey<NavigatorState> shellComparisonNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'comparison');

    return GoRouter(
      navigatorKey: parentKey,
      initialLocation: SplashScreen.route,
      routes: <GoRoute>[
        GoRoute(
          path: SplashScreen.route,
          name: SplashScreen.route,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: SignInScreen.route,
              name: SignInScreen.route,
              builder: (BuildContext context, GoRouterState state) =>
                  const SignInScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: SignUpScreen.route,
                  name: SignUpScreen.route,
                  builder: (BuildContext context, GoRouterState state) =>
                      const SignUpScreen(),
                ),
              ],
            ),
            GoRoute(
              path: ProfileScreen.route,
              name: ProfileScreen.route,
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfileScreen(),
            ),
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return HomeScreen(navigationShell: navigationShell);
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  navigatorKey: shellListNavigatorKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: ListScreen.route,
                      name: ListScreen.route,
                      pageBuilder:
                          (BuildContext context, GoRouterState state) =>
                              const NoTransitionPage<Widget>(
                        child: ListScreen(),
                      ),
                      routes: <RouteBase>[
                        // child route
                        // GoRoute(
                        //   path: 'details',
                        //   builder:
                        //       (BuildContext context, GoRouterState state) =>
                        //           const DetailsScreen(label: 'A'),
                        // ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: shellFavoritesNavigatorKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: FavoritesScreen.route,
                      name: FavoritesScreen.route,
                      pageBuilder:
                          (BuildContext context, GoRouterState state) =>
                              const NoTransitionPage<Widget>(
                        child: FavoritesScreen(),
                      ),
                      routes: <RouteBase>[
                        // child route
                        // GoRoute(
                        //   path: 'details',
                        //   builder:
                        //       (BuildContext context, GoRouterState state) =>
                        //           const DetailsScreen(label: 'B'),
                        // ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: shellComparisonNavigatorKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: ComparisonScreen.route,
                      name: ComparisonScreen.route,
                      pageBuilder:
                          (BuildContext context, GoRouterState state) =>
                              const NoTransitionPage<Widget>(
                        child: ComparisonScreen(),
                      ),
                      routes: <RouteBase>[
                        // child route
                        // GoRoute(
                        //   path: 'details',
                        //   builder:
                        //       (BuildContext context, GoRouterState state) =>
                        //           const DetailsScreen(label: 'B'),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
