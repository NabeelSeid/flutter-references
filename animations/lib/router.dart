import 'package:flutter/material.dart';

import 'package:animations/home.dart';
import 'package:animations/hero_animation.dart';
import 'package:animations/staggered_animations/mixed_staggered_animation.dart';
import 'package:animations/implicit_animations/implicit_animations.dart';
import 'package:animations/explicit_animations/explicit_animations.dart';
import 'package:animations/custom_explicit_animation/custom_explicit_animation.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final String routeName = settings.name;

  //__________________________Hero Animation______________________________
  if (routeName == RouteNames.h_animation)
    return materialPageRoute(HeroAnimation());

  //__________________________Staggered Animation______________________________
  if (routeName == RouteNames.s_animation)
    return materialPageRoute(StaggeredAnimation());

  //__________________________Implicit Animation______________________________
  // AnimatedOpacity
  if (routeName == RouteNames.i_animated_opacity)
    return materialPageRoute(IAnimatedOpacity());

  // AnimatedContainer
  if (routeName == RouteNames.i_animated_container)
    return materialPageRoute(IAnimatedContainer());

  //_____________________Custom Explicit Animation______________________________
  if (routeName == RouteNames.e_decoratedBox_transition)
    return materialPageRoute(EDecoratedBoxTransition());

  //_____________________Custom Explicit Animation______________________________
  if (routeName == RouteNames.c_e_fade_scale_transition)
    return materialPageRoute(FadeScaleTransitionWidget());

  // HomePage: animation menu
  return materialPageRoute(Home());
}

MaterialPageRoute materialPageRoute(Widget screen) =>
    MaterialPageRoute(builder: (_) => screen);

class RouteNames {
  // Hero Animations
  static const String h_animation = '/h_animation';

  // Staggered Animations
  static const String s_animation = '/s_animation';

  // Implicit Animations
  static const String i_animated_opacity = '/i_animated_opacity';
  static const String i_animated_container = '/i_animated_container';

  // Explicit Animation
  static const String e_decoratedBox_transition = '/e_decoratedBox_transition';

  // Custom Explicit Animations
  static const String c_e_fade_scale_transition = '/c_e_fade_scale_transition';
}
