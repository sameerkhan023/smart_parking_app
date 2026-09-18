class FavoriteModel {
  final String userId;
  final List<String> parkingLocationIds;

  FavoriteModel({
    required this.userId,
    required this.parkingLocationIds,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> map, String userId) {
    return FavoriteModel(
      userId: userId,
      parkingLocationIds: List<String>.from(map['parkingLocationIds'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parkingLocationIds': parkingLocationIds,
    };
  }

  FavoriteModel copyWith({
    String? userId,
    List<String>? parkingLocationIds,
  }) {
    return FavoriteModel(
      userId: userId ?? this.userId,
      parkingLocationIds: parkingLocationIds ?? this.parkingLocationIds,
    );
  }
}
