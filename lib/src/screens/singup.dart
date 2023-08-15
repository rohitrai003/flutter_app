import 'package:flutter/material.dart';

import '../features/login_page.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
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
                  child: Text('Username',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2)
                          ]))),
              const SizedBox(
                height: 10,
              ),
              textController(username, 'Username', false, TextInputType.name),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(height: 15),
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
                height: 15,
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text('----------More Signin Option----------'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    otherLoginOption(Image.asset(
                      'assets/images/google.png',
                      scale: 20,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ? '),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login here')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
