import 'package:flutter/material.dart';
import 'models/movie.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({Key? key}) : super(key: key);

  @override
  State<MockupScreenOne> createState() => _MockupScreenOneState();
}

class _MockupScreenOneState extends State<MockupScreenOne> {
  int _selectedTabIndex = 0;
  int _selectedNavIndex = 0;

  final List<String> _tabs = ['Popular', 'Upcoming', 'Now Playing'];
  
  final List<Movie> _movies = [
    Movie(
      title: 'To All the Boys: P.S. I Still Love You',
      year: '2019',
      duration: '1h 44m',
      genres: ['Romance', 'Comedy'],
      posterUrl: 'https://image.tmdb.org/t/p/w500/sM3XZI2CnaIYmvQVdZvV4FMxCJ9.jpg',
      rating: 7.2,
      description: 'Lara Jean and Peter have just taken their romance from pretend to officially real when another recipient of one of her old love letters enters the picture.',
    ),
    Movie(
      title: 'Baby Driver',
      year: '2017',
      duration: '1h 52m',
      genres: ['Car Action', 'Crime', 'Drama'],
      posterUrl: 'https://image.tmdb.org/t/p/w500/rmnQ9jKW72bHu8uKlMjPIb2VLMI.jpg',
      rating: 7.2,
      description: 'After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.',
    ),
    Movie(
      title: 'John Wick',
      year: '2019',
      duration: '2h 10m',
      genres: ['Action', 'Crime', 'Thriller'],
      posterUrl: 'https://image.tmdb.org/t/p/w500/ziEuG1essDuWuC5lpWUaw1uXY2O.jpg',
      rating: 7.2,
      description: 'John Wick is on the run after killing a member of the international assassin's guild, and with a $14 million price tag on his head, he is the target of hit men and women everywhere.',
    ),
    Movie(
      title: 'Exit',
      year: '2019',
      duration: '2h 10m',
      genres: ['Action', 'Comedy'],
      posterUrl: 'https://image.tmdb.org/t/p/w500/1XxL4LJ5WHdrcYcvdKEHxgCxAoT.jpg',
      rating: 7.2,
      description: 'Yong-nam (Jo Jung-suk) was once a promising climbing athlete but hasn\'t had much luck in life since graduation...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 16),
            _buildTabs(),
            Expanded(
              child: _buildMovieList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFF5CA0D3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              "TMDb",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white54, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    "Find your movies...",
                    style: TextStyle(color: Colors.white54),
                  ),
                  const Spacer(),
                  const Text(
                    "Sort / Filters",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Discover & Enjoy\nYour Favourite Movies",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: _selectedTabIndex == index
                    ? const Color(0xFF5CA0D3)
                    : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _tabs[index],
                style: TextStyle(
                  color: _selectedTabIndex == index
                      ? Colors.white
                      : Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        final movie = _movies[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: movie,
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Poster
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    movie.posterUrl,
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120, 
                        height: 180,
                        color: Colors.grey.shade800,
                        child: const Icon(Icons.broken_image, color: Colors.white54),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Movie Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${movie.year} • ${movie.duration}",
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.genresFormatted,
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Rating
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black12,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      currentIndex: _selectedNavIndex,
      onTap: (index) {
        setState(() {
          _selectedNavIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      ],
    );
  }
}