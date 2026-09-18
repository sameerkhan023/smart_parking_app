class PaymentModel {
  final String id;
  final String userId;
  final String reservationId;
  final double amount;
  final String status; // 'pending', 'completed', 'failed'
  final DateTime timestamp;
  final String paymentMethod;

  PaymentModel({
    required this.id,
    required this.userId,
    required this.reservationId,
    required this.amount,
    required this.status,
    required this.timestamp,
    required this.paymentMethod,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PaymentModel(
      id: documentId,
      userId: map['userId'] ?? '',
      reservationId: map['reservationId'] ?? '',
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      status: map['status'] ?? 'pending',
      timestamp: map['timestamp'] != null ? DateTime.parse(map['timestamp']) : DateTime.now(),
      paymentMethod: map['paymentMethod'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'reservationId': reservationId,
      'amount': amount,
      'status': status,
      'timestamp': timestamp.toIso8601String(),
      'paymentMethod': paymentMethod,
    };
  }
}
