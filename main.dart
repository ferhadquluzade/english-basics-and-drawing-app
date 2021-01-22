import 'package:engapp/number_screen.dart';
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
 static List<String> list = ["","","A","B","C","D","E","F","G","H","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
  int indx = 2;

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
                                           if(indx==25){
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
                                     child: Text("${list[indx]}",style:TextStyle(fontSize:100)))),
                           ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.arrow_right),
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NumberScreen()));
          }, 
        ));
  }

}