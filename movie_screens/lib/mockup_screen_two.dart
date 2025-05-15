import 'package:flutter/material.dart';

class MockupScreenTwo extends StatelessWidget {
  const MockupScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            sectionTitle('What\'s Popular'),
            horizontalMovieRow([
              {
                'title': 'Birds of Prey',
                'image': 'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
                'rating': '7.2'
              },
              {
                'title': 'Red Sparrow',
                'image': 'https://image.tmdb.org/t/p/w500/sI4jTu4fWT3JDmScZTfJnVvQHkJ.jpg',
                'rating': '6.5'
              },
              {
                'title': 'Back Movie',
                'image': 'https://via.placeholder.com/100x150',
                'rating': '6.0'
              },
            ]),
            sectionTitle('Now Playing'),
            horizontalMovieRow([
              {
                'title': 'To All the Boys',
                'image': 'https://image.tmdb.org/t/p/w500/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg',
                'rating': '6.5'
              },
              {
                'title': 'Ford v Ferrari',
                'image': 'https://image.tmdb.org/t/p/w500/xYLBgw7dHyEqmcrSk2Sq3asuSq5.jpg',
                'rating': '7.8'
              },
              {
                'title': 'Dolittle',
                'image': 'https://via.placeholder.com/100x150',
                'rating': '6.0'
              },
            ]),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget horizontalMovieRow(List<Map<String, String>> movies) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: movies.map((movie) {
          return Container(
            width: 110,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Image.network(
                  movie['image']!,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 4),
                Text(movie['title']!,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.deepPurple,
                  child: Text(
                    movie['rating']!,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}