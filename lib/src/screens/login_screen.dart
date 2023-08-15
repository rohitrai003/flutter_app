import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
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
                    otherLoginOption(Image.asset('assets/images/google.png')),
                    otherLoginOption(
                      Image.asset(
                        'assets/images/facebook.png',
                      ),
                    ),
                    otherLoginOption(Image.asset('assets/images/twitter.png')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Email, password textfield
textController(TextEditingController controller, String hintText, bool password,
    TextInputType keyboardType) {
  return TextField(
    controller: controller,
    obscureText: password,
    style: const TextStyle(color: Colors.black),
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      enabled: true,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
        color: Colors.grey.shade600,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

otherLoginOption(Image image) {
  return Container(
      height: 60,
      width: 65,
      decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(offset: Offset(1, 2), blurRadius: 3, color: Colors.grey)
          ]),
      child: Container(
        height: 40,
        width: 40,
        child: image,
      ));
}

errorLogin(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Wrong Email or Password'),
        icon: const Icon(Icons.error_outline),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Back'),
          )
        ],
      );
    },
  );
}
