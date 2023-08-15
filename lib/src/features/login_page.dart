import 'package:flutter/material.dart';

//Email, password textfield
textController(TextEditingController controller, String hintText, bool password,
    TextInputType keyboardType) {
  return TextField(
    controller: controller,
    obscureText: password,
    style: const TextStyle(color: Colors.black),
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: password
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_off,
                color: Colors.green,
              ))
          : null,
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
      child: SizedBox(
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
