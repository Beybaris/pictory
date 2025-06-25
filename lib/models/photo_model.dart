class PhotoModel {
  final String id;
  final String url;
  final String description;
  final String photographer;

  PhotoModel({
    required this.id,
    required this.url,
    required this.description,
    required this.photographer,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      url: json['urls']['regular'],
      description: json['alt_description'] ?? '',
      photographer: json['user']['name'],
    );
  }
}
