import 'package:flutter/material.dart';

class IAnimatedOpacity extends StatefulWidget {
  const IAnimatedOpacity({Key key}) : super(key: key);

  @override
  _IAnimatedOpacityState createState() => _IAnimatedOpacityState();
}

class _IAnimatedOpacityState extends State<IAnimatedOpacity> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(seconds: 1),
                  child: Text('Fade Widget'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              child: Text('Animate Opacity'),
              onPressed: () => setState(() {
                opacity = (opacity - 1).abs();
              }),
            )
          ],
        ),
      ),
    );
  }
}
