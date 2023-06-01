class Permission {
  final String id;
  final String? name;
  final String? path;
  final String? guard;

  const Permission({
    required this.id,
    required this.name,
    required this.path,
    required this.guard,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
        id: json['_id'],
        name: json['name'],
        path: json['path'],
        guard: json['guard']);
  }
}
