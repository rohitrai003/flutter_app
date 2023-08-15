import 'package:flutter/material.dart';

class DialPadPage extends StatefulWidget {
  DialPadPage({super.key});
  _DialPadPageState createState() => _DialPadPageState();
}

class _DialPadPageState extends State<DialPadPage> {
  List<String> filltext = [];
  String fillText = '';
  keypadButton(String number) {
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () {
        setState(() {
          fillText = fillText + '$number';
        });
      },
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.transparent,
        child: Text(
          '$number',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Center(
            child: Text(
              '$fillText',
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                keypadButton('1'),
                keypadButton('2'),
                keypadButton('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                keypadButton('4'),
                keypadButton('5'),
                keypadButton('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                keypadButton('7'),
                keypadButton('8'),
                keypadButton('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                keypadButton('*'),
                keypadButton('0'),
                keypadButton('#'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(65, 65),
                        backgroundColor: Colors.green,
                        shape: const CircleBorder(
                          side: BorderSide.none,
                        ),
                      ),
                      child: const Icon(
                        Icons.call,
                        size: 30,
                      )),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        child: Icon(
                          Icons.highlight_remove_sharp,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
