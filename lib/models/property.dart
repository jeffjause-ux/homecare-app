
import 'package:uuid/uuid.dart';
class Property {
  final String id;
  final String name;
  final String address;
  final double? sqft;
  final int yearBuilt;
  Property({String? id, required this.name, required this.address, this.sqft, required this.yearBuilt}) : id = id ?? const Uuid().v4();
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'address': address, 'sqft': sqft, 'yearBuilt': yearBuilt};
  factory Property.fromJson(Map<String, dynamic> j) => Property(id: j['id'], name: j['name'], address: j['address'], sqft: j['sqft']?.toDouble(), yearBuilt: j['yearBuilt']);
}
class Area {
  final String id; final String propertyId; final String name; final String type;
  Area({String? id, required this.propertyId, required this.name, required this.type}) : id = id ?? const Uuid().v4();
}
class Asset {
  final String id; final String propertyId; final String? areaId; final String name; final String category;
  final String? brand; final String? model; final String? serial; final DateTime? installDate; final DateTime? warrantyExpiry;
  Asset({String? id, required this.propertyId, this.areaId, required this.name, required this.category, this.brand, this.model, this.serial, this.installDate, this.warrantyExpiry}) : id = id ?? const Uuid().v4();
}
