import 'package:flutter/material.dart';

import 'package:animations/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animations'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            Text('Implicit Widgets'),
            ListTile(
              onTap: () =>
                  Navigator.pushNamed(context, RouteNames.i_animated_opacity),
              title: Text('AnimatedOpacity'),
              subtitle: Text(
                  'An implicit widget that animate opacity of a child widget'),
            ),
          ],
        ),
      ),
    );
  }
}
