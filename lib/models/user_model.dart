class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(
      Map<String, dynamic> map,
      ) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
      profileImage: map['profileImage'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        map['createdAt'] ?? 0,
      ),
    );
  }
}