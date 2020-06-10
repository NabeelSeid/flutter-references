import 'package:flutter/material.dart';

class MixedStaggeredAnimation extends StatelessWidget {
  MixedStaggeredAnimation(this.controller, {Key key})
      : _width = Tween<double>(begin: 10.0, end: 300.0)
            .chain(CurveTween(curve: Interval(0.0, 0.3, curve: Curves.easeOut)))
            .animate(controller),
        _height = Tween<double>(begin: 10.0, end: 300.0)
            .chain(CurveTween(curve: Interval(0.0, 0.3, curve: Curves.easeIn)))
            .animate(controller),
        _borderRadius = BorderRadiusTween(
                begin: BorderRadius.circular(0.0),
                end: BorderRadius.circular(20.0))
            .chain(
                CurveTween(curve: Interval(0.0, 0.5, curve: Curves.easeInOut)))
            .animate(controller),
        _boxShadow = BoxShadowTween(
                begin: BoxShadow(
                    color: Colors.transparent, blurRadius: 0, spreadRadius: 0),
                end: BoxShadow(
                    color: Colors.grey, blurRadius: 3, spreadRadius: 2))
            .chain(CurveTween(curve: Interval(0.5, 0.8, curve: Curves.linear)))
            .animate(controller),
        _color = TweenSequence(<TweenSequenceItem<Color>>[
          TweenSequenceItem(
              tween: ColorTween(begin: Colors.grey, end: Colors.indigo),
              weight: 1),
          TweenSequenceItem(
              tween: ColorTween(begin: Colors.indigo, end: Colors.cyan),
              weight: 2),
          TweenSequenceItem(
              tween: ConstantTween<Color>(Colors.cyan), weight: 1),
          TweenSequenceItem(
              tween: ColorTween(begin: Colors.cyan, end: Colors.pink),
              weight: 2),
          TweenSequenceItem(
              tween: ColorTween(begin: Colors.pink, end: Colors.white),
              weight: 4)
        ]).animate(controller),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> _width;
  final Animation<double> _height;
  final Animation<BorderRadius> _borderRadius;
  final Animation<BoxShadow> _boxShadow;
  // Color animation is a TweenSquences
  final Animation<Color> _color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (_, child) {
          print(_boxShadow.value);
          return Container(
            width: _width.value,
            height: _height.value,
            decoration: BoxDecoration(
              color: _color.value,
              borderRadius: _borderRadius.value,
              boxShadow: [_boxShadow.value],
            ),
          );
        });
  }
}

class StaggeredAnimation extends StatefulWidget {
  StaggeredAnimation({Key key}) : super(key: key);

  @override
  _IntervalStaggeredAnimationState createState() =>
      _IntervalStaggeredAnimationState();
}

class _IntervalStaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interval Staggered Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MixedStaggeredAnimation(_controller),
            SizedBox(height: 16.0),
            MaterialButton(
              child: Text('Animate'),
              color: Colors.cyanAccent,
              onPressed: () {
                if (_controller.isDismissed)
                  _controller.forward();
                else
                  _controller.reverse();
              },
            )
          ],
        ),
      ),
    );
  }
}

class BoxShadowTween extends Tween<BoxShadow> {
  BoxShadowTween({BoxShadow begin, BoxShadow end})
      : super(begin: begin, end: end);

  /// Returns the value this variable has at the given animation clock value.
  @override
  BoxShadow lerp(double t) => BoxShadow.lerp(begin, end, t);
}
