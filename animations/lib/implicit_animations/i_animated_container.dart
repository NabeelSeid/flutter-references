import 'dart:math';

import 'package:flutter/material.dart';

class IAnimatedContainer extends StatefulWidget {
  IAnimatedContainer({Key key}) : super(key: key);

  @override
  _IAnimatedContainerState createState() => _IAnimatedContainerState();
}

class _IAnimatedContainerState extends State<IAnimatedContainer> {
  double width = 128.0;
  double radius = 0.0;
  double margin = 0.0;
  Color color = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 128,
                minWidth: 128,
              ),
              child: AnimatedContainer(
                width: width,
                duration: Duration(seconds: 1),
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () => setState(() {
                double rand = Random().nextDouble();
                radius = rand * 64; //(radius - 16.0).abs();
                margin = rand * 64; //(margin - 16.0).abs();
                color = Color.lerp(Colors.cyan, Colors.pink, rand);
                // color == Colors.cyanAccent
                // ? Colors.cyan
                // : Colors.cyanAccent;
                width = rand * 300; //width == 128 ? 300 : 128;
              }),
              child: Text('Animate Container'),
            ),
          ],
        ),
      ),
    );
  }
}
