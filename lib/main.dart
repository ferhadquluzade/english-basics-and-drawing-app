import 'package:engapp/Screens/LettersScreen/letters_screen.dart';
import 'package:engapp/Screens/NumbersScreen/number_screen.dart';
import 'package:engapp/Screens/Paint/canvas.dart';
import 'package:engapp/Screens/Paint/painter.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static dynamic screen=LettersScreen() ;
  getScreen() => screen;
  int _cur_indx = 0;
  void changePage(int indx) {
    setState(() {
      _cur_indx = indx;
      if (indx == 1) {
        setState(() {
          screen = NumberScreen();
        });
        ;
      } else if (indx == 2) {
        setState(() {
          screen = CustomCanvas();
        });
      }else{
        setState(() {
                  screen=LettersScreen();
                });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              backgroundColor: Colors.blue,
              label: "Letters"),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            backgroundColor: Colors.yellowAccent,
            label: "Numbers",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_paint),
              backgroundColor: Colors.green[600],
              label: "Draw")
        ],
        onTap: changePage,
        currentIndex: _cur_indx,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}