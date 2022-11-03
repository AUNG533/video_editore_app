import 'package:flutter/material.dart';
import 'package:video_editing_app/screen/create_screen.dart';
import 'package:video_editing_app/screen/me_screen.dart';
import 'package:video_editing_app/screen/mix_screen.dart';
import 'package:video_editing_app/screen/search_screen.dart';

import '../components/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  static const List<Widget> _screens = <Widget>[
    MixScreen(),
    Search(),
    CreateScreen(),
    MeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading: const Image(
          image: AssetImage('assets/img.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tv_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      
      body: _screens.elementAt(_selectedIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: bgColor,
            icon: Icon(Icons.dashboard_customize),
            label: 'Mix',
          ),
          BottomNavigationBarItem(
            backgroundColor: bgColor,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: bgColor,
            icon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            backgroundColor: bgColor,
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
