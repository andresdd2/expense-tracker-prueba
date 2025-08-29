import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screen/home_page.dart';
import '../../features/stats/presentation/screen/stats_page.dart';
import '../../features/settings/presentation/screen/settings_page.dart';
import '../../features/transactions/presentation/screen/new_transaction_page.dart';
import '../widgets/app_shell.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) =>
            AppShell(navigationShell: navShell),
        branches: [
          // 0: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // 1: Stats
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/stats',
                name: 'stats',
                builder: (context, state) => const StatsPage(),
              ),
            ],
          ),
          // 2: New Transaction ("+")
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/new',
                name: 'new',
                builder: (context, state) => const NewTransactionPage(),
              ),
            ],
          ),
          // 3: Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
