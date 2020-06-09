import 'package:flutter/material.dart';

const hero_tag = '__hero_animation__';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
        child: Hero(
            tag: hero_tag,
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                'Hero Animation',
                style: Theme.of(context).textTheme.headline6,
              ),
            )),
      ),
    );
  }
}
