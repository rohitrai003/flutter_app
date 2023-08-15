import 'package:flutter/material.dart';
import 'package:login_save/src/screens/main_pages/contact.dart';
import 'package:login_save/src/screens/main_pages/dialpad.dart';
import 'package:login_save/src/screens/main_pages/history.dart';
import 'package:login_save/src/screens/main_pages/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> pages = [
    HistoryPage(),
    DialPadPage(),
    ContactPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call me Phone'),
        centerTitle: true,
        bottom: const Tab(
          child: Text('Online'),
        ),
        bottomOpacity: 0.8,
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.dialpad), label: 'Calls'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
