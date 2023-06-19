class Student {
  final int id;
  final String name;
  final String username;
  final String password;

  Student({
    this.id = 1,
    required this.name,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'password': password,
    };
  }
}
