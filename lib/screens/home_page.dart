import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/photo_provider.dart';
import '../widgets/photo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Переход в избранное (реализуем позже)
            },
          ),
        ],
      ),
      body: provider.photos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => provider.loadRandomPhotos(),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: provider.photos.length,
                itemBuilder: (context, index) {
                  final photo = provider.photos[index];
                  return PhotoCard(photo: photo);
                },
              ),
            ),
    );
  }
}
