import 'package:flutter/material.dart';

import 'package:animations/router.dart';
import 'package:animations/hero_animation.dart';

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
            menuTitle('Hero Animation'),
            heroTile(RouteNames.h_animation,
                title: 'Hero Animation', tag: hero_tag),

            // -------------------------
            // Implicit ANIMATION
            // -------------------------
            menuTitle('Implicit Animations'),
            menuTile(RouteNames.i_animated_opacity, title: 'AnimatedOpacity'),
            menuTile(RouteNames.i_animated_container,
                title: 'AnimatedContainer'),

            // -------------------------
            // EXPLICIT ANIMATION
            // -------------------------
            menuTitle('Explicit Animations'),
            menuTile(RouteNames.e_decoratedBox_transition,
                title: 'DecoratedBoxTransition'),

            // -------------------------
            // CUSTOM EXPLICIT ANIMATION
            // -------------------------
            menuTitle('Custom Explicit Animations'),
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

  Widget heroTile(
    String routeName, {
    @required String tag,
    String title,
    String subtitle,
  }) =>
      Builder(
        builder: (c) => ListTile(
          onTap: () => Navigator.pushNamed(c, routeName),
          title: Hero(
            tag: tag,
            child: Material(
              type: MaterialType.transparency,
              child: Text(title ?? 'Animation'),
            ),
          ),
          subtitle: Text(subtitle ?? ''),
        ),
      );
}
