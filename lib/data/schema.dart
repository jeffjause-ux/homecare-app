
import 'package:drift/drift.dart';

class Properties extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  RealColumn get sqft => real().nullable()();
  IntColumn get yearBuilt => integer()();
  @override Set<Column> get primaryKey => {id};
}
class Areas extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text().customConstraint('REFERENCES properties(id)')();
  TextColumn get name => text()();
  TextColumn get type => text()();
  @override Set<Column> get primaryKey => {id};
}
class Assets extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text().customConstraint('REFERENCES properties(id)')();
  TextColumn get areaId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get brand => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get serial => text().nullable()();
  DateTimeColumn get installDate => dateTime().nullable()();
  DateTimeColumn get warrantyExpiry => dateTime().nullable()();
  @override Set<Column> get primaryKey => {id};
}
class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text().customConstraint('REFERENCES properties(id)')();
  TextColumn get assetId => text().nullable()();
  TextColumn get areaId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  TextColumn get recurrence => text()(); // enum name
  IntColumn get interval => integer()();
  DateTimeColumn get nextDue => dateTime()();
  DateTimeColumn get lastCompleted => dateTime().nullable()();
  TextColumn get priority => text()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  RealColumn get estimatedCost => real().nullable()();
  @override Set<Column> get primaryKey => {id};
}
class RepairLogs extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text()();
  TextColumn get taskId => text().nullable()();
  TextColumn get assetId => text().nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text()();
  RealColumn get cost => real()();
  TextColumn get photoPaths => text().withDefault(const Constant(''))(); // JSON list
  TextColumn get contractorId => text().nullable()();
  TextColumn get partsUsed => text().withDefault(const Constant(''))();
  @override Set<Column> get primaryKey => {id};
}
class InventoryItems extends Table {
  TextColumn get id => text()();
  TextColumn get propertyId => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  IntColumn get quantity => integer()();
  TextColumn get location => text()();
  IntColumn get lowStockThreshold => integer()();
  RealColumn get unitCost => real().nullable()();
  @override Set<Column> get primaryKey => {id};
}
