import 'package:flutter/material.dart';

class MockupScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue[50],
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumanji: The Next Level',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Action • Adventure • Comedy • Fantasy',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'What\'s Popular',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildMovieRow(
              imageUrl: 'https://m.media-amazon.com/images/M/MV5BMmIzNDk4MDEtNWZiMi00NDZlLTg2ZjctYjA3MjQ0NDkwZjhhXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
              title: 'Birds of Prey',
              rating: '7.2',
              description: 'Action, Crime, Comedy, Drama',
            ),
            _buildMovieRow(
              imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTA3MDkxOTc4NDdeQTJeQWpwZ15BbWU4MDAxNzgyNTQz._V1_.jpg',
              title: 'Red Sparrow',
              rating: '6.5',
              description: 'Mystery, Thriller',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Now Playing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildMovieRow(
              imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjA2NjU5MTg1OV5BMl5BanBnXkFtZTgwNjU1NDk3NzM@._V1_.jpg',
              title: 'To All the Boys: P.S. I Still Love You',
              rating: '6.9',
              description: 'Romance, Comedy',
            ),
            _buildMovieRow(
              imageUrl: 'https://m.media-amazon.com/images/M/MV5BM2UwMDVmMDItM2I2Yi00NGZmLTk4ZTItOWVjZTIwYjNhZjk0XkEyXkFqcGdeQXVyMTA1OTYzOTUx._V1_.jpg',
              title: 'Ford v Ferrari',
              rating: '7.2',
              description: 'Drama, Action',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieRow({required String imageUrl, required String title, required String rating, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    SizedBox(width: 4.0),
                    Text(rating, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.grey),
        ],
      ),
    );
  }
}