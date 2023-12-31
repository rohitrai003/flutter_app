import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/login_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  void _login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    Navigator.pushReplacementNamed(context, '/home');
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 2)
                      ]),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2)
                          ]))),
              const SizedBox(height: 10),
              textController(email, 'Email', false,
                  TextInputType.emailAddress), // Email textfield
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2)
                          ]))),
              const SizedBox(height: 10),
              textController(password, 'Password', true,
                  TextInputType.visiblePassword), // Password textfield
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (email.text.isNotEmpty && password.text.isNotEmpty) {
                    _login(context);
                  } else {
                    errorLogin(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text('----------More Login Option----------'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    otherLoginOption(Image.asset(
                      'assets/images/google.png',
                      scale: 15,
                    )),
                    otherLoginOption(
                      Image.asset(
                        'assets/images/facebook.png',
                      ),
                    ),
                    otherLoginOption(Image.asset(
                      'assets/images/twitter.png',
                    )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text('Don\'t Have an account ? ')),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: const Text('Create One'))
            ],
          ),
        ),
      ),
    );
  }
}
