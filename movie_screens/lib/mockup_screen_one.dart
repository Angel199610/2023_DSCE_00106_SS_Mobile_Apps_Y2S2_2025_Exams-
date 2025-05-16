import 'package:flutter/material.dart';

class MockupScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Q Find your movies...',
                          border: InputBorder.none,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sort |', style: TextStyle(color: Colors.grey)),
                              SizedBox(width: 4),
                              Text('Filters', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'DISCOVER & ENJOY\nYOUR FAVOURITE MOVIES',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton('Popular', isSelected: true),
                  _buildCategoryButton('Upcoming'),
                  _buildCategoryButton('Now Playing'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildMovieCard(
                    title: 'To All the Boys: P.S. I Still Love You (2019)',
                    imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjA2NjU5MTg1OV5BMl5BanBnXkFtZTgwNjU1NDk3NzM@._V1_.jpg',
                    rating: '7.2',
                    description: 'Romance, Comedy\nLara Jean and Peter have just taken their romance from a lo...',
                  ),
                  _buildMovieCard(
                    title: 'Baby Driver',
                    imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjM3MTI3MzQ2M15BMl5BanBnXkFtZTgwMDE5NjI1MjI@._V1_.jpg',
                    rating: '7.2',
                    description: 'Action, Crime, Drama\nAfter being coerced into working for a crime boss, a yo...',
                  ),
                  _buildMovieCard(
                    title: 'John Wick',
                    imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTU2NjA5NjI5NV5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg',
                    rating: '7.2',
                    description: 'Action, Crime, Thriller\nJohn Wick is on the run after killing a member of the intern...',
                  ),
                  _buildMovieCard(
                    title: 'Exit',
                    imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjI2MjEwZmMtZmJhZS00NjQ2LWJkM2QtNTliNjE2NzQ0NDhjXkEyXkFqcGdeQXVyNjM4NzI1NTQ@._V1_.jpg',
                    rating: '7.2',
                    description: 'Action, Comedy\nVietnam / La luna rossa were one...',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMovieCard({required String title, required String imageUrl, required String rating, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 150,
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
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
        ],
      ),
    );
  }
}