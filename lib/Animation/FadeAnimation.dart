import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final Color backgroundColor = Colors.white;

  const FadeAnimation(this.delay, this.child, SizedBox sizedBox, FadeAnimation fadeAnimation, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: 0.0, end: 1.0);

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: const Duration(milliseconds: 500),
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: 1,
        child: Transform.translate(
          offset: const Offset(0, 0.1),
          child: animation
        ),
      ),
    );
  }
}