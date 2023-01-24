import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

/// Code Source - https://github.com/maddyb99/shimmer_animation

class ShimmerAnimator extends StatefulWidget {
  final Color color;
  final double opacity;
  final Duration duration;
  final Duration interval;
  final ShimmerDirection direction;
  final Widget child;

  const ShimmerAnimator({
    super.key,
    required this.child,
    required this.color,
    required this.opacity,
    required this.duration,
    required this.interval,
    required this.direction,
  });

  @override
  ShimmerAnimatorState createState() => ShimmerAnimatorState();
}

//Animator state controls the animation using all the parameters defined
class ShimmerAnimatorState extends State<ShimmerAnimator>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.6, curve: Curves.decelerate),
    ))
      ..addListener(() async {
        if (controller.isCompleted) {
          timer = Timer(widget.interval,
              () => mounted ? controller.forward(from: 0) : null);
        }
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CustomSplashAnimation(
        context: context,
        position: animation.value,
        color: widget.color,
        opacity: widget.opacity,
        begin: widget.direction.begin,
        end: widget.direction.end,
      ),
      child: widget.child,
    );
  }
}
