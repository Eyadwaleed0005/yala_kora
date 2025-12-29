class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    this.phone,
    this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final String? phone;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
}
