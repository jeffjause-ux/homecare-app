
import 'package:flutter/material.dart';
import '../widgets/adaptive_layout.dart';
class RepairsScreen extends StatelessWidget { const RepairsScreen({super.key}); @override Widget build(BuildContext context) => AdaptiveScaffold(title: 'Repair Logs', selectedIndex: 2, child: ListView(padding: EdgeInsets.all(16), children: [FilledButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('Log New Repair')), SizedBox(height: 12), Card(child: ListTile(title: Text('Replaced garbage disposal'), subtitle: Text('Kitchen • 2026-08-12 • \$220 • Moen GX50C • Photo attached'), trailing: Text('\$220'))), Card(child: ListTile(title: Text('Fixed leaky faucet'), subtitle: Text('Master bath • 2026-07-03 • \$45 parts'), trailing: Text('\$45')))])); }
