import 'package:flutter/material.dart';
import 'mockup_screen_one.dart';
import 'mockup_screen_two.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  int _currentIndex = 0;

  final screens = [
    MockupScreenOne(),
    MockupScreenTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      home: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          ],
        ),
      ),
    );
  }
}
