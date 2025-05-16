import 'package:flutter/material.dart';

class MockupScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Q Find your movies...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sort |', style: TextStyle(color: Colors.grey, fontSize: 14)),
                              SizedBox(width: 4),
                              Text('Filters', style: TextStyle(color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'DISCOVER & ENJOY\nYOUR FAVOURITE MOVIES',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
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
                    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FTo_All_the_Boys%3A_P.S._I_Still_Love_You&psig=AOvVaw2aaUfrTvGS16MGlE8E-hzl&ust=1747469287417000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCOCGg8TEp40DFQAAAAAdAAAAABAE',
                    rating: '7.2',
                    description: 'Romance, Comedy\nLara Jean and Peter have just taken their romance from a lo...',
                  ),
                  _buildMovieCard(
                    title: 'Baby Driver',
                    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.redbubble.com%2Fi%2Fposter%2FBaby-driver-by-mixtape80%2F105516333.LVTDI&psig=AOvVaw3Q_XzmwbMqJVopRepfWLT6&ust=1747469393912000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCMjN_bvFp40DFQAAAAAdAAAAABAE',
                    rating: '7.2',
                    description: 'Action, Crime, Drama\nAfter being coerced into working for a crime boss, a yo...',
                  ),
                  _buildMovieCard(
                    title: 'John Wick',
                    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.peakpx.com%2Fen%2Fhd-wallpaper-desktop-pcfld&psig=AOvVaw1TAE4w7EuU7yFEjPdLIwXS&ust=1747469578901000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCICt9ODFp40DFQAAAAAdAAAAABAE',
                    rating: '7.2',
                    description: 'Action, Crime, Thriller\nJohn Wick is on the run after killing a member of the intern...',
                  ),
                  _buildMovieCard(
                    title: 'Exit',
                    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Ftitle%2Ftt1988621%2F&psig=AOvVaw3M1b3e2O8G3f3k83sfNgSX&ust=1747469691989000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCKCgrpjGp40DFQAAAAAdAAAAABAE',
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
        color: isSelected ? Colors.red : Colors.grey[200],
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 150,
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
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
        ],
      ),
    );
  }
}