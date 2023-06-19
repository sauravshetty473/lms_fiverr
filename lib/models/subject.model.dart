

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
}