
import 'package:uuid/uuid.dart';
enum RecurrenceType { oneTime, monthly, yearly, seasonal, customDays }
enum TaskPriority { low, medium, high, critical }
class MaintenanceTask {
  final String id; final String propertyId; final String? assetId; final String? areaId;
  final String title; final String description; final String category;
  final RecurrenceType recurrence; final int interval; // e.g. every X months
  final DateTime nextDue; final DateTime? lastCompleted; final TaskPriority priority;
  final bool isArchived; final double? estimatedCost;
  MaintenanceTask({
    String? id, required this.propertyId, this.assetId, this.areaId,
    required this.title, required this.description, required this.category,
    required this.recurrence, required this.interval, required this.nextDue,
    this.lastCompleted, this.priority = TaskPriority.medium, this.isArchived = false, this.estimatedCost,
  }) : id = id ?? const Uuid().v4();

  bool get isOverdue => nextDue.isBefore(DateTime.now());
  bool get isDueSoon => nextDue.difference(DateTime.now()).inDays <= 7 && !isOverdue;
}
class RepairLog {
  final String id; final String propertyId; final String? taskId; final String? assetId;
  final DateTime date; final String description; final double cost; final List<String> photoPaths; final String? contractorId; final List<String> partsUsed;
  RepairLog({String? id, required this.propertyId, this.taskId, this.assetId, required this.date, required this.description, required this.cost, this.photoPaths = const [], this.contractorId, this.partsUsed = const []}) : id = id ?? const Uuid().v4();
}
class InventoryItem {
  final String id; final String propertyId; final String name; final String category; final int quantity; final String location; final int lowStockThreshold; final double? unitCost;
  InventoryItem({String? id, required this.propertyId, required this.name, required this.category, required this.quantity, required this.location, required this.lowStockThreshold, this.unitCost}) : id = id ?? const Uuid().v4();
  bool get isLowStock => quantity <= lowStockThreshold;
}
