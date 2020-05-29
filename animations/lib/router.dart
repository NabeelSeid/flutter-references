import 'package:animations/main.dart';
import 'package:flutter/material.dart';

import 'package:animations/implicit_animations/i_animated_opacity.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final String routeName = settings.name;

  switch (routeName) {
    case RouteNames.i_animated_opacity:
      return materialPageRoute(IAnimatedOpacity());
      break;
    default:
      return materialPageRoute(MyHomePage());
  }
}

MaterialPageRoute materialPageRoute(Widget screen) =>
    MaterialPageRoute(builder: (_) => screen);

class RouteNames {
  static const String i_animated_opacity = '/i_animated_opacity';
}
