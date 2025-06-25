import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';

class PhotoService {
  static const _baseUrl = 'https://api.unsplash.com';
  static const _accessKey =
      'R2w3wJ1aumLPAZUSG8zkPFRwTQ9AHe44exmoMs4tups'; // вставь свой ключ

  Future<List<PhotoModel>> getRandomPhotos({int count = 8}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/photos/random?count=$count'),
      headers: {'Authorization': 'Client-ID $_accessKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Ошибка загрузки фото');
    }
  }
}
