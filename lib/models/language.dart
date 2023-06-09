class Language {
  final String id;
  final String name;
  final String code;
  final bool status;

  const Language({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
        id: json['_id'],
        name: json['name'],
        code: json['code'],
        status: json['status']);
  }
}
