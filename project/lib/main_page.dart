import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/calendar_page.dart';
import 'package:project/diary_page.dart';
import 'package:project/home_page.dart';
import 'package:project/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _navIndex = [
    const HomePage(),
    const CalendarPage(),
    const DiaryPage(),
    const SettingsPage(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("home page"),
      //   centerTitle: true,
      // ),
      body: _navIndex[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightBlue,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
