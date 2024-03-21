import 'package:exam_demo_unsplash/pages/collections_page.dart';
import 'package:exam_demo_unsplash/pages/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [SearchPage(), CollectionPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white38),
        items: const [
          BottomNavigationBarItem(

              icon: Icon(
                Icons.search,
                color: Colors.white70,
              ),
              label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections, color: Colors.white70),
            label: "Collection",
          )
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            _controller!.animateToPage(
              _selectedIndex,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          });
        },
      ),
    );
  }
}
