import 'package:sandeep/models/role.dart';

class User {
  final String id;
  final String email;
  final String? password;
  final bool? isActive;
  final Role? role;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.isActive,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        email: json['email'],
        password: json['password'],
        isActive: json['isActive'] || true,
        role: Role.fromJson(json['role']));
  }
}
