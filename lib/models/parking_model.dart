class ParkingModel {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final int totalSlots;
  final int availableSlots;
  final double pricePerHour;

  ParkingModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.totalSlots,
    required this.availableSlots,
    required this.pricePerHour,
  });

  factory ParkingModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ParkingModel(
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
}
