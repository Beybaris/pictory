import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import '../services/photo_service.dart';

class PhotoProvider extends ChangeNotifier {
  final _service = PhotoService();
  List<PhotoModel> photos = [];

  PhotoProvider() {
    loadRandomPhotos();
  }

  Future<void> loadRandomPhotos() async {
    try {
      photos = await _service.getRandomPhotos();
      notifyListeners();
    } catch (e) {
      debugPrint('Ошибка при загрузке: $e');
    }
  }
}
