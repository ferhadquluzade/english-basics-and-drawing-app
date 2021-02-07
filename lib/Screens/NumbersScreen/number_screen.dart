import 'package:engapp/Screens/LettersScreen/letters_screen.dart';
import 'package:engapp/Screens/Paint/canvas.dart';
import "package:flutter/material.dart";

class NumberScreen extends StatefulWidget {
   int indx ;
  var canvas;
 NumberScreen ({this.indx,this.canvas});
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
 var number=NumberScreen(indx:48,canvas:CustomCanvas());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.pink,
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
backgroundColor:Colors.yellowAccent,
foregroundColor:Colors.black,
child:Icon(Icons.add),
onPressed: (){
    setState(() {
                                number.indx += 1;
                                if (number.indx == 58) {
                                  number.indx = 48;
                                }
                              });
},
      ),
       );
  }
}
