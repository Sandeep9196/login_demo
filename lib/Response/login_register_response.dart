import 'package:sandeep/models/role.dart';
import 'package:sandeep/models/user.dart';

class LoginResponseModel {
  final User user;
  final Role? roles;
  final List? permissions;
  final String? token;

  const LoginResponseModel({
    required this.user,
    required this.roles,
    required this.permissions,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: User.fromJson(json['user']),
      roles: Role.fromJson(json['roles']),
      permissions: json['permissions'],
      token: json['token'],
    );
  }
}

class RegisterResponseModel {
  final User user;
  final List? permissions;
  final String? token;

  const RegisterResponseModel({
    required this.user,
    required this.permissions,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      user: User.fromJson(json['user']),
      permissions: json['permissions'],
      token: json['token'],
    );
  }
}
