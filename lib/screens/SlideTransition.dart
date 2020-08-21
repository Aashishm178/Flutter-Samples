import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TransitionStates { Up, Down, Left, Right }

class SlideTransitionPage extends StatefulWidget {
  static const String id = 'slide_transition_page';
  @override
  _SlideTransitionPageState createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage>
    with TickerProviderStateMixin {
  double topExtinctWhenMovingUp = 104;
  double bottomExtinctWhenMovingUp = 344;
  double rightExtinct = 207.0;
  double leftExtinct = 0.0;
  double initialPositionTop = 210;
  double initialPositionBottom = 240;
  double initialPositionLeft = 104;
  double initialPositionRight = 104;
  AnimationController animationControllerForUp;
  AnimationController animationControllerForDown;
  Animation<double> sizeAnimationUpButton;
  Animation<double> sizeAnimationDownButton;
  AnimationController animationControllerForLeft;
  AnimationController animationControllerForRight;
  Animation<double> sizeAnimationLeftButton;
  Animation<double> sizeAnimationRightButton;

  @override
  void initState() {
    super.initState();
    animationControllerForUp =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              animationControllerForUp.reset();
          });
    animationControllerForDown =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              animationControllerForDown.reset();
          });
    animationControllerForLeft =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              animationControllerForLeft.reset();
          });
    animationControllerForRight =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed)
              animationControllerForRight.reset();
          });
    sizeAnimationUpButton = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 75),
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 25),
      ],
    ).animate(animationControllerForUp);
    sizeAnimationDownButton = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 75),
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 25),
      ],
    ).animate(animationControllerForDown);
    sizeAnimationLeftButton = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 75),
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 25),
      ],
    ).animate(animationControllerForLeft);
    sizeAnimationRightButton = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 75),
        TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 25),
      ],
    ).animate(animationControllerForRight);
  }

  void updatePosition(TransitionStates state) {
    if (state == TransitionStates.Up) {
      animationControllerForUp.forward();
      setState(() {
        initialPositionTop = initialPositionTop > topExtinctWhenMovingUp
            ? initialPositionTop - 104
            : initialPositionTop;
        initialPositionBottom =
            initialPositionBottom > bottomExtinctWhenMovingUp
                ? initialPositionBottom
                : initialPositionBottom + 104;
      });
    }
    if (state == TransitionStates.Down) {
      animationControllerForDown.forward();
      setState(() {
        initialPositionTop = initialPositionTop > bottomExtinctWhenMovingUp
            ? initialPositionTop
            : initialPositionTop + 104;
        initialPositionBottom = initialPositionBottom < topExtinctWhenMovingUp
            ? initialPositionBottom
            : initialPositionBottom - 104;
      });
    }
    if (state == TransitionStates.Left) {
      animationControllerForLeft.forward();
      setState(() {
        initialPositionLeft = initialPositionLeft > leftExtinct
            ? initialPositionLeft - 104
            : initialPositionLeft;
        initialPositionRight = initialPositionRight > rightExtinct
            ? initialPositionRight
            : initialPositionRight + 104;
      });
    }
    if (state == TransitionStates.Right) {
      animationControllerForRight.forward();
      setState(() {
        initialPositionLeft = initialPositionLeft < rightExtinct
            ? initialPositionLeft + 104
            : initialPositionLeft;
        initialPositionRight = initialPositionRight > leftExtinct
            ? initialPositionRight - 104
            : initialPositionRight;
      });
    }
  }

  @override
  void dispose() {
    animationControllerForUp.dispose();
    animationControllerForDown.dispose();
    animationControllerForLeft.dispose();
    animationControllerForRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 550,
                  child: Wrap(
                    direction: Axis.vertical,
                    children: List.generate(
                        15,
                        (index) => Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 2.0),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )).toList(),
                  ),
                ),
                AnimatedPositioned(
                    left: initialPositionLeft,
                    right: initialPositionRight,
                    top: initialPositionTop,
                    bottom: initialPositionBottom,
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    duration: Duration(milliseconds: 500)),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            AnimatedBuilder(
              animation: animationControllerForUp,
              builder: (context, child) => Transform.scale(
                alignment: Alignment.center,
                scale: sizeAnimationUpButton.value,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    elevation: MaterialStateProperty.all(5.0),
                  ),
                  onPressed: () => updatePosition(TransitionStates.Up),
                  child: Text('Up'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: animationControllerForDown,
              builder: (context, child) => Transform.scale(
                alignment: Alignment.center,
                scale: sizeAnimationDownButton.value,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    elevation: MaterialStateProperty.all(5.0),
                  ),
                  onPressed: () => updatePosition(TransitionStates.Down),
                  child: Text('Down'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: animationControllerForLeft,
              builder: (context, child) => Transform.scale(
                alignment: Alignment.center,
                scale: sizeAnimationLeftButton.value,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    elevation: MaterialStateProperty.all(5.0),
                  ),
                  onPressed: () => updatePosition(TransitionStates.Left),
                  child: Text('Left'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: animationControllerForRight,
              builder: (context, child) => Transform.scale(
                alignment: Alignment.center,
                scale: sizeAnimationRightButton.value,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    elevation: MaterialStateProperty.all(5.0),
                  ),
                  onPressed: () => updatePosition(TransitionStates.Right),
                  child: Text('Right'),
                ),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
