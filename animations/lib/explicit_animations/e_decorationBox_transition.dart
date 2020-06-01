import 'package:flutter/material.dart';

class EDecoratedBoxTransition extends StatefulWidget {
  EDecoratedBoxTransition({Key key}) : super(key: key);

  @override
  _EDecorationBoxTransitionState createState() =>
      _EDecorationBoxTransitionState();
}

class _EDecorationBoxTransitionState extends State<EDecoratedBoxTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Decoration> _decorationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _decorationAnimation = DecorationTween(
      begin: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.zero,
      ),
      end: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26.0),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 2)
        ],
      ),
    ).animate(_animationController);

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
          title: Text('DecorationBoxTransition'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DecoratedBoxTransition(
                decoration: _decorationAnimation,
                child: Container(
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              MaterialButton(
                child: Text('Animate'),
                color: Colors.lightBlue,
                onPressed: () {
                  if (_animationController.isCompleted)
                    _animationController.reverse();
                  if (_animationController.isDismissed)
                    _animationController.forward();
                },
              ),
            ],
          ),
        ));
  }
}
