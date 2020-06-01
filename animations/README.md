# Flutter Animations

Flutter code based animation are clasiffied into two

### Implicit Animations

- Widgets that animates a child widget property to a new set value. Built-in implicity animations follow a naming convention of AnimatedFoo. They accept duration and curve.
- Use `TweenAnimationBuilder` to create a custom implicit animation

### Explicit Animations

- Animations that are user controller via `AnimationController`. `AnimationController` exposes animation status and controllers(forward, reverse, animateTo, stop, repeat and fling) that enables for repeating and discontinous effects. It is also possible to control more than one animation with only one animationController
- To create custom Explicit animation use `AnimatedWidget` or `AnimatedBuilder`. They encapsulate the common pattern of calling setState everytime the animation's value changes.

## Implemented

---

### Implicit Animations

[AnimatedOpacit](https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html) &nbsp;&nbsp;|&nbsp;&nbsp; [AnimatedContainer](https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html)

### Explicit Animations

[AnimatedContainer](https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html): [ [DecorationTween](https://api.flutter.dev/flutter/widgets/DecorationTween-class.html) ]

### Custom Explicit Animations

`FadeScaleTranstion` : FadeTranstion and ScaleTranstion together.
