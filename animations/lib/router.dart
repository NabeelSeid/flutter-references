import 'package:animations/main.dart';
import 'package:flutter/material.dart';

import 'implicit_animations/implicit_animations.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final String routeName = settings.name;

  // AnimatedOpacity
  if (routeName == RouteNames.i_animated_opacity)
    return materialPageRoute(IAnimatedOpacity());

  // AnimatedContainer
  if (routeName == RouteNames.i_animated_container)
    return materialPageRoute(IAnimatedContainer());

  // HomePage: animation menu
  return materialPageRoute(MyHomePage());
}

MaterialPageRoute materialPageRoute(Widget screen) =>
    MaterialPageRoute(builder: (_) => screen);

class RouteNames {
  static const String i_animated_opacity = '/i_animated_opacity';
  static const String i_animated_container = '/i_animated_container';
}
