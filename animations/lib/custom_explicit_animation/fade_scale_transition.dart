import 'package:flutter/material.dart';

class FadeScaleTransitionWidget extends StatefulWidget {
  const FadeScaleTransitionWidget({Key key}) : super(key: key);

  @override
  _FadeScaleTranstionWidgetState createState() =>
      _FadeScaleTranstionWidgetState();
}

class _FadeScaleTranstionWidgetState extends State<FadeScaleTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom FadeScaleTranstion'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FadeScaleTranstion(
                animation: _curvedAnimation,
                child: Container(
                  color: Colors.pinkAccent,
                  width: 1.0,
                  height: 1.0,
                ),
              ),
              SizedBox(height: 216.0),
              MaterialButton(
                  child: Text('Animate'),
                  color: Colors.cyanAccent,
                  onPressed: () {
                    if (_animationController.isCompleted)
                      _animationController.reverse();
                    if (_animationController.isDismissed)
                      _animationController.forward();
                  })
            ],
          ),
        ));
  }
}

// A custom animation that implement both
// FadeTranstion and ScaleTranstion together
class FadeScaleTranstion extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  const FadeScaleTranstion({
    Key key,
    @required this.animation,
    @required this.child,
  })  : assert(child != null),
        super(key: key, listenable: animation);

  final Widget child;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.identity()
      ..scale(
        _sizeTween.evaluate(animation),
        _sizeTween.evaluate(animation),
        1.0,
      );

    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Transform(
        transform: transform,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
