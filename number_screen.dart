import "package:flutter/material.dart";
class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  static List<int> list = [1,2,3,4,5,6,7,8,9,10];
  int indx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
          color:Colors.pink,
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
                           Container(
                               width:MediaQuery.of(context).size.width/2,
          height:MediaQuery.of(context).size.height/2,
                             child: CircleAvatar(
                                 child: GestureDetector(
                                     onDoubleTap: () {
                                         setState(() {
                                           if(indx==10){
                                             indx=0;
                                           }else{
                                           indx += 1;}
                                         });
                                     },
                                     onLongPress: () {
                                         if (indx != 0) {
                                           indx -= 1;
                                         }
                                     },
                                     child: Text("${list[indx]}",style:TextStyle(fontSize:75)))),
                           ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        child:Icon(Icons.arrow_left),
        backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
