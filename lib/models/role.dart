class Role {
  final String id;
  final String name;
  final List? permissions;
  final bool? isActive;

  const Role({
    required this.id,
    required this.name,
    required this.permissions,
    required this.isActive,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
        id: json['_id'],
        name: json['name'],
        permissions: json['permissions'],
        isActive: json['isActive']);
  }
}
