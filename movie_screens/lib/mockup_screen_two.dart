import 'package:flutter/material.dart';

class MockupScreenTwo extends StatelessWidget {
  final List<Map<String, String>> popularMovies = [
    {
      "title": "Birds of Prey",
      "genre": "Action, Comedy",
      "rating": "7.2",
      "image": "https://upload.wikimedia.org/wikipedia/en/3/33/Birds_of_Prey_poster.jpg"
    },
    {
      "title": "Red Sparrow",
      "genre": "Mystery, Thriller",
      "rating": "6.5",
      "image": "https://upload.wikimedia.org/wikipedia/en/b/bc/Red_Sparrow.png"
    },
    {
      "title": "Backtrace",
      "genre": "Drama, Action",
      "rating": "6.0",
      "image": "https://upload.wikimedia.org/wikipedia/en/3/3a/Backtrace_poster.jpg"
    },
  ];

  final List<Map<String, String>> nowPlaying = [
    {
      "title": "To All the Boys: P.S. I Still Love You",
      "genre": "Romantic, Comedy",
      "rating": "6.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/6d/To_All_the_Boys_P.S._I_Still_Love_You.png"
    },
    {
      "title": "Ford v Ferrari",
      "genre": "Drama, Action",
      "rating": "7.8",
      "image": "https://upload.wikimedia.org/wikipedia/en/8/89/Ford_Ferrari_poster.jpg"
    },
    {
      "title": "Dolittle",
      "genre": "Adventure, Family",
      "rating": "5.6",
      "image": "https://upload.wikimedia.org/wikipedia/en/9/98/Dolittle_%282020_film%29_poster.jpg"
    },
  ];

  Widget movieCard(Map<String, String> movie) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Image.network(movie['image']!, height: 150, fit: BoxFit.cover),
          SizedBox(height: 5),
          Text(movie['title']!, maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(movie['rating']!, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.network(
            "https://upload.wikimedia.org/wikipedia/en/1/1d/Jumanji_The_Next_Level_poster.jpg",
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text("What's Popular", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: popularMovies.map(movieCard).toList(),
            ),
          ),
          SizedBox(height: 20),
          Text("Now Playing", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: nowPlaying.map(movieCard).toList(),
            ),
          ),
        ],
      ),
    );
  }
}