
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/adaptive_layout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: 'HomeCare Dashboard',
      selectedIndex: 0,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _Header(),
          const SizedBox(height: 16),
          Wrap(spacing: 12, runSpacing: 12, children: [
            _StatCard(title: 'Overdue', value: '3', color: Colors.red, onTap: () => context.go('/tasks')),
            _StatCard(title: 'Due this week', value: '7', color: Colors.orange),
            _StatCard(title: 'Total Cost YTD', value: '\$1,240', color: Colors.green),
            _StatCard(title: 'Low Stock', value: '2', color: Colors.amber),
          ]),
          const SizedBox(height: 24),
          Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Wrap(spacing: 12, children: [
            FilledButton.icon(onPressed: () => context.go('/tasks'), icon: const Icon(Icons.add_task), label: const Text('Add Task')),
            FilledButton.icon(onPressed: () => context.go('/repairs'), icon: const Icon(Icons.build), label: const Text('Log Repair')),
            OutlinedButton.icon(onPressed: () => context.go('/inventory'), icon: const Icon(Icons.inventory), label: const Text('Add Part')),
          ]),
          const SizedBox(height: 24),
          Text('Upcoming (Next 30 Days)', style: Theme.of(context).textTheme.titleLarge),
          const Card(child: ListTile(leading: Icon(Icons.filter_alt), title: Text('Replace HVAC filter'), subtitle: Text('Every 3 months • Furnace • Due in 2 days'), trailing: Chip(label: Text('High')))),
          const Card(child: ListTile(leading: Icon(Icons.water_drop), title: Text('Clean gutters'), subtitle: Text('Seasonal • Exterior • Due Nov 15'), trailing: Chip(label: Text('Medium')))),
          const Card(child: ListTile(leading: Icon(Icons.smoke_free), title: Text('Test smoke detectors'), subtitle: Text('Yearly • Safety • Due Dec 1'))),
        ],
      ),
    );
  }
}
class _Header extends StatelessWidget {
  const _Header();
  @override Widget build(BuildContext context) => Card(color: Theme.of(context).colorScheme.primaryContainer, child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [Icon(Icons.home_repair_service, size: 48), SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Lowesville Home', style: Theme.of(context).textTheme.headlineSmall), Text('2,400 sqft • Built 1998 • 3 bed / 2 bath')]))])));
}
class _StatCard extends StatelessWidget {
  final String title; final String value; final Color color; final VoidCallback? onTap;
  const _StatCard({required this.title, required this.value, required this.color, this.onTap});
  @override Widget build(BuildContext context) => InkWell(onTap: onTap, child: Card(child: Container(width: 160, padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)), SizedBox(height: 8), Text(value, style: Theme.of(context).textTheme.headlineMedium), Text(title)]))));
}
