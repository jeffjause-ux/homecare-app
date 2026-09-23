
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/dashboard_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/repairs_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/assets_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/settings_screen.dart';

class HomeCareApp extends StatelessWidget {
  const HomeCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: [
      GoRoute(path: '/', builder: (_, __) => const DashboardScreen()),
      GoRoute(path: '/tasks', builder: (_, __) => const TasksScreen()),
      GoRoute(path: '/repairs', builder: (_, __) => const RepairsScreen()),
      GoRoute(path: '/inventory', builder: (_, __) => const InventoryScreen()),
      GoRoute(path: '/assets', builder: (_, __) => const AssetsScreen()),
      GoRoute(path: '/reports', builder: (_, __) => const ReportsScreen()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
    ]);

    return MaterialApp.router(
      title: 'HomeCare',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D6F), brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D6F), brightness: Brightness.dark),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
