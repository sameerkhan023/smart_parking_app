class ParkingSlotModel {
  final String id;
  final String parkingId;
  final String slotNumber;
  final String status; // e.g., 'available', 'occupied', 'reserved'

  ParkingSlotModel({
    required this.id,
    required this.parkingId,
    required this.slotNumber,
    required this.status,
  });

  factory ParkingSlotModel.fromMap(Map<String, dynamic> map, String documentId, String parkingId) {
    return ParkingSlotModel(
      id: documentId,
      parkingId: parkingId,
      slotNumber: map['slotNumber'] ?? '',
      status: map['status'] ?? 'available',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slotNumber': slotNumber,
      'status': status,
    };
  }

  ParkingSlotModel copyWith({
    String? id,
    String? parkingId,
    String? slotNumber,
    String? status,
  }) {
    return ParkingSlotModel(
      id: id ?? this.id,
      parkingId: parkingId ?? this.parkingId,
      slotNumber: slotNumber ?? this.slotNumber,
      status: status ?? this.status,
    );
  }
}
