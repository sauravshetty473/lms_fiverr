

class Subject {
  final int id;
  final String name;
  final String imageUrl;

  Subject({
    this.id = 1,
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image_url': imageUrl,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] ?? 1,
      name: map['name'],
      imageUrl: map['image_url'],
    );
  }
}