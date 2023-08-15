import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  logoutProcess(context) {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Status Account'),
              trailing: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.lightGreen,
                  child: Icon(
                    Icons.done,
                    size: 25,
                  )),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Terms and Conditions'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Delete Account'),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          InkWell(
            onTap: () => logoutProcess(context),
            child: const ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
