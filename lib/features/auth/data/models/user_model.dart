class UserModel {
  final String id;
  final String email;
  final String role;
  final String name;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final String accessToken;
  final String refreshToken;

  UserModel({
    required this.id,
    required this.email,
    required this.role,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userId'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'email': email,
      'role': role,
      'name': name,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
