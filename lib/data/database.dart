
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'schema.dart';
part 'database.g.dart';

@DriftDatabase(tables: [Properties, Areas, Assets, Tasks, RepairLogs, InventoryItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'homecare_db'));
  @override int get schemaVersion => 1;

  // Streams
  Stream<List<Task>> watchTasks(String propertyId) => (select(tasks)..where((t) => t.propertyId.equals(propertyId))).watch();
  Stream<List<RepairLog>> watchRepairs(String propertyId) => (select(repairLogs)..where((t) => t.propertyId.equals(propertyId))).watch();
  Stream<List<InventoryItem>> watchInventory(String propertyId) => (select(inventoryItems)..where((t) => t.propertyId.equals(propertyId))).watch();

  Future<void> upsertTask(TasksCompanion task) => into(tasks).insertOnConflictUpdate(task);
  Future<void> upsertRepair(RepairLogsCompanion r) => into(repairLogs).insertOnConflictUpdate(r);
  Future<void> upsertInventory(InventoryItemsCompanion i) => into(inventoryItems).insertOnConflictUpdate(i);
}
