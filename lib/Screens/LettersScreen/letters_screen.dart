import 'package:flutter_tts/flutter_tts.dart';
import "package:flutter/material.dart";

// ignore: must_be_immutable
class LettersScreen extends StatefulWidget {
  int indx;
  LettersScreen({
    this.indx,
  });
  @override
  _LettersScreenState createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  var letter = LettersScreen(
    indx: 65,
  );
  FlutterTts tts = FlutterTts();
  void speak(String text) {
    tts.setLanguage("en-US");
    tts.setPitch(1.2);
    tts.speak(text);
    tts.setVolume(1.0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    speak("A");
  }
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.blueAccent],begin: Alignment.topLeft,end:Alignment.bottomRight),
   
        
        ),

        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: CircleAvatar(
                      child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              if (letter.indx != 65) {
                                letter.indx -= 1;
                              }
                              speak("${String.fromCharCode(letter.indx)}");
                            });
                          },
                          child: Text("${String.fromCharCode(letter.indx)}",
                              style: TextStyle(fontSize: 100)))),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            letter.indx += 1;
            if (letter.indx > 90) {
              letter.indx = 65;
            }
          });
          speak("${String.fromCharCode(letter.indx)}");
        },
      ),
    );
  }
}
