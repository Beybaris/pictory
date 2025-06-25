import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/photo_model.dart';

class PhotoDetailPage extends StatelessWidget {
  final PhotoModel photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: photo.url,
              placeholder: (context, url) => const SizedBox(
                height: 300,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(photo.photographer),
            ),
            if (photo.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  photo.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 32),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Позже добавим избранное
              },
            ),
            const Text('Добавить в избранное'),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
