class ReservationModel {
  final String id;
  final String userId;
  final String parkingId;
  final String slotId;
  final DateTime startTime;
  final DateTime endTime;
  final String status; // e.g., 'pending', 'active', 'completed', 'cancelled'
  final double totalAmount;

  ReservationModel({
    required this.id,
    required this.userId,
    required this.parkingId,
    required this.slotId,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.totalAmount,
  });

  factory ReservationModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ReservationModel(
      id: documentId,
      userId: map['userId'] ?? '',
      parkingId: map['parkingId'] ?? '',
      slotId: map['slotId'] ?? '',
      startTime: map['startTime'] != null ? DateTime.parse(map['startTime']) : DateTime.now(),
      endTime: map['endTime'] != null ? DateTime.parse(map['endTime']) : DateTime.now(),
      status: map['status'] ?? 'pending',
      totalAmount: (map['totalAmount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'parkingId': parkingId,
      'slotId': slotId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'status': status,
      'totalAmount': totalAmount,
    };
  }

  ReservationModel copyWith({
    String? id,
    String? userId,
    String? parkingId,
    String? slotId,
    DateTime? startTime,
    DateTime? endTime,
    String? status,
    double? totalAmount,
  }) {
    return ReservationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      parkingId: parkingId ?? this.parkingId,
      slotId: slotId ?? this.slotId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}
