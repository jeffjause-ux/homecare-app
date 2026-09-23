
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class AdaptiveScaffold extends StatelessWidget {
  final String title; final Widget child; final int selectedIndex;
  const AdaptiveScaffold({super.key, required this.title, required this.child, required this.selectedIndex});
  @override Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final items = [
      (Icons.dashboard, 'Dashboard', '/'),
      (Icons.task_alt, 'Tasks', '/tasks'),
      (Icons.build, 'Repairs', '/repairs'),
      (Icons.inventory_2, 'Inventory', '/inventory'),
      (Icons.apartment, 'Assets', '/assets'),
      (Icons.bar_chart, 'Reports', '/reports'),
      (Icons.settings, 'Settings', '/settings'),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Row(children: [
        if (isDesktop) NavigationRail(selectedIndex: selectedIndex, onDestinationSelected: (i) => context.go(items[i].$3), labelType: NavigationRailLabelType.all, destinations: items.map((e) => NavigationRailDestination(icon: Icon(e.$1), label: Text(e.$2))).toList()),
        Expanded(child: child),
      ]),
      bottomNavigationBar: isDesktop ? null : NavigationBar(selectedIndex: selectedIndex, onDestinationSelected: (i) => context.go(items[i].$3), destinations: items.map((e) => NavigationDestination(icon: Icon(e.$1), label: e.$2)).toList()),
    );
  }
}
