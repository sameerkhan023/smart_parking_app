class ParkingLocationModel {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final int totalSlots;
  final int availableSlots;
  final double pricePerHour;

  ParkingLocationModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.totalSlots,
    required this.availableSlots,
    required this.pricePerHour,
  });

  factory ParkingLocationModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ParkingLocationModel(
      id: documentId,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      totalSlots: map['totalSlots'] ?? 0,
      availableSlots: map['availableSlots'] ?? 0,
      pricePerHour: (map['pricePerHour'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'totalSlots': totalSlots,
      'availableSlots': availableSlots,
      'pricePerHour': pricePerHour,
    };
  }

  ParkingLocationModel copyWith({
    String? id,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    int? totalSlots,
    int? availableSlots,
    double? pricePerHour,
  }) {
    return ParkingLocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      totalSlots: totalSlots ?? this.totalSlots,
      availableSlots: availableSlots ?? this.availableSlots,
      pricePerHour: pricePerHour ?? this.pricePerHour,
    );
  }
}
