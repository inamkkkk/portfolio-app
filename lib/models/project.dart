class Project {
  final String title;
  final String description;
  final String imageUrl;

  Project({required this.title, required this.description, required this.imageUrl});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
