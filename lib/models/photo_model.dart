class PhotoModel {
  final String url;
  final String photographer;
  final String username;
  final String profileImage;
  final String description;

  PhotoModel({
    required this.url,
    required this.photographer,
    required this.username,
    required this.profileImage,
    required this.description,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      url: json['urls']['regular'],
      photographer: json['user']['name'] ?? '',
      username: json['user']['username'] ?? '',
      profileImage: json['user']['profile_image']['medium'] ?? '',
      description: json['description'] ?? '',
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PhotoModel && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
