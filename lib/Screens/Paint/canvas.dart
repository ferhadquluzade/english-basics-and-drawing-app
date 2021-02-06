import 'package:engapp/Screens/Paint/painter.dart';
import "package:flutter/material.dart";

class CustomCanvas extends StatefulWidget {
  @override
  _CustomCanvasState createState() => _CustomCanvasState();
}

class _CustomCanvasState extends State<CustomCanvas> {
  final List<Offset> _offsets = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onPanDown: (details) {
              final renderBox = context.findRenderObject() as RenderBox;
              final localPosition =
                  renderBox.globalToLocal(details.globalPosition);
              print("localPosition:$localPosition");
              setState(() {
                _offsets.add(localPosition);
              });
            },
            onPanUpdate: (details) {
              setState(() {
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                print("localPosition:$localPosition");
                setState(() {
                  _offsets.add(localPosition);
                });
              });
            },
            onPanEnd: (details) {
              setState(() {
                _offsets.add(null);
              });
            },
            child: Center(
                child: CustomPaint(
                    painter: Painter(_offsets),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.35))),
          ),
        ],
      ),
    );
  }
}
