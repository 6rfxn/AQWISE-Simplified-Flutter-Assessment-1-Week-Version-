import 'package:flutter/material.dart';
import 'api_list_screen.dart';
import 'bookmark_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnimated = false;
  double _containerSize = 100.0;
  Color _containerColor = Colors.blue;

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
      _containerSize = _isAnimated ? 200.0 : 100.0;
      _containerColor = _isAnimated ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simplified Flutter Assessment'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // AnimatedContainer
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _containerSize,
              height: _containerSize,
              decoration: BoxDecoration(
                color: _containerColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(),
            ),
            const SizedBox(height: 16),
            
            // Button 1: API List Screen
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostsListScreen(),
                    ),
                  );
                },
                child: const Text('Api List'),
              ),
            ),
            const SizedBox(height: 16),
            
            // Button 2: Bookmarks
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookmarksScreen(),
                    ),
                  );
                },
                child: const Text('Bookmarks'),
              ),
            ),
            const SizedBox(height: 16),
            
            // Button 3: Animation
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _toggleAnimation,
                child: Text('Press Me !'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),

      // Theme Button
      floatingActionButton: FloatingActionButton(
        onPressed: widget.toggleTheme,
        mini: true,
        child: const Icon(Icons.brightness_6),
      ),
    );
  }
}

