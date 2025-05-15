import 'package:flutter/material.dart';

class MockupScreenOne extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      "title": "To All the Boys: P.S. I Still Love You",
      "subtitle": "Romance, Comedy",
      "duration": "1h 48m",
      "rating": "7.2",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/6d/To_All_the_Boys_P.S._I_Still_Love_You.png",
    },
    {
      "title": "Baby Driver",
      "subtitle": "Car Action, Crime, Drama",
      "duration": "1h 53m",
      "rating": "7.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/8e/Baby_Driver_poster.jpg",
    },
    {
      "title": "John Wick",
      "subtitle": "Action, Crime, Thriller",
      "duration": "2h 10m",
      "rating": "7.4",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/9/98/John_Wick_TeaserPoster.jpg",
    },
    {
      "title": "Exit",
      "subtitle": "Action, Comedy",
      "duration": "2h 10m",
      "rating": "6.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/e/e6/Exit_%282019_film%29.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Discover & Enjoy Your Favourite Movies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (_, index) {
                final movie = movies[index];
                return ListTile(
                  leading: Image.network(movie["image"]!, width: 50, fit: BoxFit.cover),
                  title: Text(movie["title"]!),
                  subtitle: Text("${movie["subtitle"]} • ${movie["duration"]}"),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.purple[100],
                    child: Text(movie["rating"]!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}