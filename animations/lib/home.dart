import 'package:flutter/material.dart';

import 'package:animations/router.dart';

class Home extends StatelessWidget {
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
            menuTitle('Implicit Widgets'),
            menuTile(RouteNames.i_animated_opacity, title: 'AnimatedOpacity'),
            menuTile(RouteNames.i_animated_container,
                title: 'AnimatedContainer'),

            // -------------------------
            // EXPLICIT ANIMATION
            // -------------------------
            menuTitle('Explicit Animation'),
            menuTile(RouteNames.e_decoratedBox_transition,
                title: 'DecoratedBoxTransition'),

            // -------------------------
            // CUSTOM EXPLICIT ANIMATION
            // -------------------------
            menuTitle('Explicit Animation'),
            menuTile(RouteNames.c_e_fade_scale_transition,
                title: 'FadeScaleTranstion'),
          ],
        ),
      ),
    );
  }

  Widget menuTitle(String title) => Builder(
        builder: (c) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: Theme.of(c).textTheme.headline6,
          ),
        ),
      );

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
