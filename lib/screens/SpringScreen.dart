import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpringScreen extends StatefulWidget {
  static const String id = 'spring_screen';
  @override
  _SpringScreenState createState() => _SpringScreenState();
}

class _SpringScreenState extends State<SpringScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation springAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    springAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.5),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.5, end: 0.8),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.8, end: 0.0),
        weight: 10,
      ),
    ]).animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedLoadingIndicator(
          controller: controller, springAnimation: springAnimation),
    );
  }
}

class AnimatedLoadingIndicator extends StatelessWidget {
  const AnimatedLoadingIndicator({
    Key key,
    @required this.controller,
    @required this.springAnimation,
  }) : super(key: key);

  final AnimationController controller;
  final Animation springAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: CircularProgressIndicator(
                strokeWidth: springAnimation.value * 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                    springAnimation.value > 0 && springAnimation.value < 1
                        ? Colors.black.withOpacity(springAnimation.value)
                        : Colors.black),
              ),
            ),
            SizedBox(
              width: springAnimation.value * 20,
            ),
            Flexible(
              child: Text(
                'Loading',
                style: TextStyle(
                    letterSpacing: springAnimation.value * 4,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
