
import 'package:flutter/material.dart';
import '../widgets/adaptive_layout.dart';
class TasksScreen extends StatefulWidget { const TasksScreen({super.key}); @override State<TasksScreen> createState() => _TasksScreenState(); }
class _TasksScreenState extends State<TasksScreen> {
  final tasks = [
    {'title':'Replace HVAC Filter','category':'HVAC','due':'2026-09-25','priority':'High','recurrence':'Every 3 months'},
    {'title':'Clean Gutters','category':'Exterior','due':'2026-11-15','priority':'Medium','recurrence':'Seasonal'},
    {'title':'Test Smoke/CO Detectors','category':'Safety','due':'2026-12-01','priority':'Critical','recurrence':'Yearly'},
    {'title':'Flush Water Heater','category':'Plumbing','due':'2027-01-10','priority':'Medium','recurrence':'Yearly'},
    {'title':'Inspect Roof','category':'Roof','due':'2027-03-01','priority':'High','recurrence':'Yearly'},
  ];
  @override Widget build(BuildContext context) {
    return AdaptiveScaffold(title: 'Maintenance Tasks', selectedIndex: 1, child: Column(children: [
      Padding(padding: const EdgeInsets.all(16), child: Row(children: [Expanded(child: SearchBar(hintText: 'Search tasks...')), SizedBox(width: 12), FilledButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('New Task'))])),
      Expanded(child: ListView.builder(itemCount: tasks.length, itemBuilder: (c,i){ final t=tasks[i]; return Card(margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6), child: ListTile(leading: Checkbox(value: false, onChanged: (_){}), title: Text(t['title']!), subtitle: Text('${t['category']} • ${t['recurrence']} • Due ${t['due']}'), trailing: Row(mainAxisSize: MainAxisSize.min, children: [Chip(label: Text(t['priority']!)), IconButton(icon: Icon(Icons.more_vert), onPressed: (){})]),)); }))
    ]));
  }
}
