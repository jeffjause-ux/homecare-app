
import 'package:flutter/material.dart';
import '../widgets/adaptive_layout.dart';
class SettingsScreen extends StatelessWidget { const SettingsScreen({super.key}); @override Widget build(BuildContext context) => AdaptiveScaffold(title: 'Settings', selectedIndex: 6, child: ListView(padding: EdgeInsets.all(16), children: [ListTile(title: Text('Property'), subtitle: Text('Lowesville Home - 2,400 sqft')), Divider(), SwitchListTile(title: Text('Notifications'), subtitle: Text('Remind 24h before due'), value: true, onChanged: (_){}), ListTile(title: Text('Backup & Restore'), subtitle: Text('Local DB: homecare_db.sqlite'), trailing: Icon(Icons.backup)), ListTile(title: Text('Data Location'), subtitle: Text('Windows: %APPDATA%/HomeCare • Android: /data/data/com.homecare/files')), ListTile(title: Text('Theme'), trailing: SegmentedButton(segments: [ButtonSegment(value: 'light', label: Text('Light')), ButtonSegment(value: 'dark', label: Text('Dark'))], selected: {'light'}))]));
}
