import 'package:flutter/material.dart';

class AnimatedRoute extends PageRouteBuilder {
  final Widget page;
  final int duration;
  final Curve animate;
  final Alignment alignment;

  AnimatedRoute(this.page,
      {this.duration = 300,
      this.animate = Curves.easeIn,
      this.alignment = const Alignment(0.8, 1)})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return page;
          },
          transitionDuration: Duration(milliseconds: duration),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation = CurvedAnimation(parent: animation, curve: animate);
            return ScaleTransition(
              scale: animation,
              alignment: alignment,
              child: child,
            );
          },
        );
}
