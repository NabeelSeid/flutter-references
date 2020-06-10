# Flutter Animations

Flutter code based animation are clasiffied into two

### Implicit Animations

- Widgets that animates a child widget property to a new set value. Built-in implicity animations follow a naming convention of AnimatedFoo. They accept duration and curve.
- Use `TweenAnimationBuilder` to create a custom implicit animation

### Explicit Animations

- Animations that are user controller via `AnimationController`. `AnimationController` exposes animation status and controllers(forward, reverse, animateTo, stop, repeat and fling) that enables for repeating and discontinous effects. It is also possible to control more than one animation with only one animationController
- To create custom Explicit animation use `AnimatedWidget` or `AnimatedBuilder`. They encapsulate the common pattern of calling setState everytime the animation's value changes.

### Hero Animations

- Transition animation between screens. Not much digged here. To make animation smooth wrap child of Hero with a transparent Material widget

### Staggered Animations

- Staggered animation is a series of animation instead of animations all together. There are two ways to create staggered animations: Using [Intervals](https://api.flutter.dev/flutter/animation/Interval-class.html) and [TweenSequences](https://api.flutter.dev/flutter/animation/animation-library.html#staggered-animations-tweensequences)
- `Intervals` give more controlle over the animation types and thier duration(delayed, overlaped, sequencial). To delay next animation start the next animation interval at a delayed time. `E.g [Interval(0.0, 0.2), Interval(0.4, 1.0)] This is not actual dart code, just for explanation`.
- `TweenSquences` is a type of tween. It only animate a single type. Duration is expressed as weight. It does not allow animation overlapping since it only animate a single type. For delay effect use [ConstantTween](https://api.flutter.dev/flutter/animation/ConstantTween-class.html).

> ## Custom Tween
>
> If there is no built-in tween for a type or making it tween generic do not work create Custom FooTween
>
> ```dart
> Class FooTween Extend Tween<Foo> {
>   FooTween({Foo begin, Foo end}) : super(begin: begin, end: end);
>
>    /// Returns the value this variable has at
>    /// the given animation clock value.
>    @override
>    Foo lerp(double t) => Foo.lerp(begin, end, t);
> }
> ```

> ## [Debuging](https://flutter.dev/docs/testing/code-debugging#debugging-animations)
>
> Show down animation to debug it. Either set huge duration or set [timeDilation](https://api.flutter.dev/flutter/scheduler/timeDilation.html) to large number to slow down app's time consumption

## Implemented

---

### Implicit Animations

[AnimatedOpacit](https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html) &nbsp;&nbsp;|&nbsp;&nbsp; [AnimatedContainer](https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html)

### Explicit Animations

[AnimatedContainer](https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html): [ [DecorationTween](https://api.flutter.dev/flutter/widgets/DecorationTween-class.html) ]

### Custom Explicit Animations

`FadeScaleTranstion` : FadeTranstion and ScaleTranstion together.
