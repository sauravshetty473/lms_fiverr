class Teacher {
  final int id;
  final String name;
  final int subjectId;
  final String imageUrl;

  Teacher({
    this.id = 1,
    required this.name,
    required this.subjectId,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subject_id': subjectId,
      'image_url': imageUrl,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'] ?? 1,
      name: map['name'],
      subjectId: map['subject_id'],
      imageUrl: map['image_url'],
    );
  }
}