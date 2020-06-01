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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              'Implicit Widgets',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            menuTile(
              RouteNames.i_animated_opacity,
              title: 'AnimatedOpacity',
              subtitle:
                  'An implicit widget that animate opacity of a child widget',
            ),
            menuTile(RouteNames.i_animated_container,
                title: 'AnimatedContainer'),
            // -------------------------
            // CUSTOM EXPLICIT ANIMATION
            // -------------------------
            SizedBox(height: 16.0),
            Text(
              'Custom Explicit Animation',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16.0),
            menuTile(RouteNames.c_e_fade_scale_transition,
                title: 'FadeScaleTranstion'),
          ],
        ),
      ),
    );
  }

  Widget menuTile(
    String routeName, {
    String title,
    String subtitle,
  }) =>
      Builder(
        builder: (c) => ListTile(
          onTap: () => Navigator.pushNamed(c, routeName),
          title: Text(title ?? 'Animation'),
          subtitle: Text(subtitle ?? ''),
        ),
      );
}
