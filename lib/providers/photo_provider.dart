import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import '../services/photo_service.dart';

class PhotoProvider extends ChangeNotifier {
  final List<PhotoModel> _photos = [];
  final List<PhotoModel> _favorites = [];

  List<PhotoModel> get photos => _photos;
  List<PhotoModel> get favorites => _favorites;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRandomPhotos() async {
    _isLoading = true;
    notifyListeners();

    try {
      final newPhotos = await PhotoService().getRandomPhotos(count: 8);
      _photos.clear();
      _photos.addAll(newPhotos);
    } catch (e) {
      print('Ошибка при загрузке фото: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(PhotoModel photo) {
    if (_favorites.contains(photo)) {
      _favorites.remove(photo);
    } else {
      _favorites.add(photo);
    }
    notifyListeners();
  }

  bool isFavorite(PhotoModel photo) {
    return _favorites.contains(photo);
  }
}
