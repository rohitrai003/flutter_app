import 'package:flutter/material.dart';
import 'package:login_save/src/screens/main_pages/contact.dart';
import 'package:login_save/src/screens/main_pages/dialpad.dart';
import 'package:login_save/src/screens/main_pages/history.dart';
import 'package:login_save/src/screens/main_pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  List<Widget> pages = [
    HistoryPage(),
    DialPadPage(),
    ContactPage(),
    SettingsPage(),
  ];

  logoutProcess() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do You Want To Logout ? '),
          actions: [
            TextButton(
                onPressed: () => _logout(context), child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      },
    );
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call me Phone'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => logoutProcess(),
            icon: const Icon(Icons.logout),
          ),
        ],
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
            BottomNavigationBarItem(
                icon: Icon(Icons.dialpad), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'History'),
          ]),
    );
  }
}
