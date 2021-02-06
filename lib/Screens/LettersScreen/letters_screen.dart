import 'package:engapp/Screens/NumbersScreen/number_screen.dart';
import 'package:engapp/Screens/Paint/canvas.dart';
import "package:flutter/material.dart";

class LettersScreen extends StatefulWidget {
  int indx ;
  var canvas;
  LettersScreen ({this.indx,this.canvas});
  @override
  _LettersScreenState createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  var letter=LettersScreen(indx:65,canvas:CustomCanvas());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          color: Colors.pink,
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
                            onDoubleTap: () {
                              setState(() {
                                letter.indx += 1;                                
                                if (letter.indx == 91) {
                                  letter.indx = 65;
                                }
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                if (letter.indx != 65) {
                                  letter.indx -= 1;
                                }
                              });
                            },
                            child: Text("${String.fromCharCode(letter.indx)}",
                                style: TextStyle(fontSize: 100)))),
                  ),
                ],
              ),
              ClipRRect(borderRadius:BorderRadius.all(Radius.circular(30)),child:Container(child:letter.canvas,width:MediaQuery.of(context).size.width*0.9,height:MediaQuery.of(context).size.height*0.35))
              ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_right),
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NumberScreen()));

          },
          label: Text("Move on"),
        ));
  }
}
