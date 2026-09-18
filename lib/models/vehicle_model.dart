class VehicleModel {
  final String id;
  final String userId;
  final String numberPlate;
  final String type; // e.g., 'car', 'bike', 'suv'
  final String model;

  VehicleModel({
    required this.id,
    required this.userId,
    required this.numberPlate,
    required this.type,
    required this.model,
  });

  factory VehicleModel.fromMap(Map<String, dynamic> map, String documentId, String userId) {
    return VehicleModel(
      id: documentId,
      userId: userId,
      numberPlate: map['numberPlate'] ?? '',
      type: map['type'] ?? '',
      model: map['model'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numberPlate': numberPlate,
      'type': type,
      'model': model,
    };
  }

  VehicleModel copyWith({
    String? id,
    String? userId,
    String? numberPlate,
    String? type,
    String? model,
  }) {
    return VehicleModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      numberPlate: numberPlate ?? this.numberPlate,
      type: type ?? this.type,
      model: model ?? this.model,
    );
  }
}
