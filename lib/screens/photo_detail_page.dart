import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/photo_model.dart';
import 'package:provider/provider.dart';
import '../providers/photo_provider.dart';

class PhotoDetailPage extends StatelessWidget {
  final PhotoModel photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'ART ',
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'GALLERY',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {}, // Поиск позже
          ),
          IconButton(
            icon: Icon(
              context.watch<PhotoProvider>().isFavorite(photo)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<PhotoProvider>().toggleFavorite(photo);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Инфо о фотографе
            Row(
              children: [
                /// Аватар
                CircleAvatar(
                  backgroundImage: NetworkImage(photo.profileImage),
                  radius: 24,
                ),
                const SizedBox(width: 12),

                /// Имя и ник
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      photo.photographer,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '@${photo.username}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),

                /// Сердце
                IconButton(
                  icon: Icon(
                    context.watch<PhotoProvider>().isFavorite(photo)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context.read<PhotoProvider>().toggleFavorite(photo);
                  },
                ),

                /// Кнопка скачать
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      // TODO: скачать фото
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Фото
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: photo.url,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
