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
              color: Colors.red,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumanji: The Next Level',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Action • Adventure • Comedy • Fantasy',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'What\'s Popular',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            _buildMovieRow(
              imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FTo_All_the_Boys%3A_P.S._I_Still_Love_You&psig=AOvVaw2aaUfrTvGS16MGlE8E-hzl&ust=1747469287417000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCOCGg8TEp40DFQAAAAAdAAAAABAE',
              title: 'To All the Boys: P.S. I Still Love You',
              rating: '6.9',
              description: 'Romance, Comedy',
            ),
            _buildMovieRow(
              imageUrl: 'https://www.imdb.com/title/tt1950186/?ref_=vp_ov_t',
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 90,
                  color: Colors.grey,
                  child: Center(child: Text('Image Failed', style: TextStyle(color: Colors.white))),
                );
              },
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    SizedBox(width: 4.0),
                    Text(rating, style: TextStyle(fontSize: 14, color: Colors.white)),
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