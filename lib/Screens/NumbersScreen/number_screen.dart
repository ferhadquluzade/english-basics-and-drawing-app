import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable
class NumberScreen extends StatefulWidget {
  int indx;
  NumberScreen({
    this.indx,
  });
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  var number = NumberScreen(indx: 48);
  FlutterTts tts = FlutterTts();

  void speak(String text) {
    tts.setLanguage("en-US");
    tts.setPitch(1.2);
    tts.speak(text);
    tts.setVolume(1.0);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    speak("0");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(        decoration:BoxDecoration(gradient: LinearGradient(colors: [Colors.yellowAccent,Colors.blueAccent],begin: Alignment.topLeft,end:Alignment.bottomRight),
   
        
        ),

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: CircleAvatar(
                      backgroundColor: Colors.yellowAccent,
                      child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              if (number.indx != 48) {
                                number.indx -= 1;
                              }
                              speak("${String.fromCharCode(number.indx)}");
                            });
                          },
                          child: Text("${String.fromCharCode(number.indx)}",
                              style: TextStyle(fontSize: 75)))),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            number.indx += 1;
            if (number.indx == 58) {
              number.indx = 48;
            }
          });
          speak("${String.fromCharCode(number.indx)}");
        },
      ),
    );
  }
}
