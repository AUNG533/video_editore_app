import 'package:flutter/material.dart';
import 'package:video_editing_app/screen/create_screen.dart';
import 'package:video_editing_app/screen/me_screen.dart';
import 'package:video_editing_app/screen/mix_screen.dart';
import 'package:video_editing_app/screen/search_screen.dart';

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
      backgroundColor: const Color.fromARGB(250, 20, 21, 24),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(250, 20, 21, 24),
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
        backgroundColor: const Color.fromARGB(250, 20, 21, 24),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(250, 20, 21, 24),
            icon: Icon(Icons.dashboard_customize),
            label: 'Mix',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(250, 20, 21, 24),
            icon: Icon(Icons.search),
            label: 'Mix',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(250, 20, 21, 24),
            icon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(250, 20, 21, 24),
            icon: Icon(Icons.person),
            label: 'Mix',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
