class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.isRead,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map, String documentId, String userId) {
    return NotificationModel(
      id: documentId,
      userId: userId,
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      timestamp: map['timestamp'] != null ? DateTime.parse(map['timestamp']) : DateTime.now(),
      isRead: map['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  NotificationModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? message,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
