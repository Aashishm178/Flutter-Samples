import 'package:flutter/material.dart';

class FAbButtonScreen extends StatefulWidget {
  static const String id = 'FAbButtonScreen';
  @override
  _FAbButtonScreenState createState() => _FAbButtonScreenState();
}

class _FAbButtonScreenState extends State<FAbButtonScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController scaleController;
  Animation translateAnimationOne,
      translateAnimationOTwo,
      scaleAnimation,
      translateAnimationThree;
  Animation rotationAnimation;
  Animation logoRotation;
  AnimationController straightController;
  Animation straightAnimationOneTranslate, straightAnimationTwoTranslate;
  Animation straightRotation;

  @override
  void initState() {
    straightController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    straightController.addListener(() {
      setState(() {});
    });
    straightRotation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: straightController, curve: Curves.easeIn));
    scaleController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    scaleController.addListener(() {
      setState(() {});
    });
    scaleController.forward();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    controller.addListener(() {
      setState(() {});
    });
    scaleAnimation =
        Tween<double>(begin: 8.0, end: 1.0).animate(scaleController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    logoRotation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeIn));
    translateAnimationOne = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75),
      TweenSequenceItem(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25),
    ]).animate(controller);
    translateAnimationOTwo = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55),
      TweenSequenceItem(tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45),
    ]).animate(controller);
    translateAnimationThree = TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35),
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65),
    ]).animate(controller);
    straightAnimationOneTranslate = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75),
      TweenSequenceItem(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25),
    ]).animate(straightController);
    straightAnimationTwoTranslate = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55),
      TweenSequenceItem(tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45),
    ]).animate(straightController);
    super.initState();
  }

  double getDirectionInDegrees(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 30,
            left: 30,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset.fromDirection(getDirectionInDegrees(270),
                      straightAnimationOneTranslate.value * 70),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        getDirectionInDegrees(straightRotation.value))
                      ..scale(straightAnimationOneTranslate.value),
                    child: CircleButton(
                      color: Colors.red,
                      icon: Icon(Icons.camera),
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getDirectionInDegrees(270),
                      straightAnimationTwoTranslate.value * 140),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        getDirectionInDegrees(straightRotation.value))
                      ..scale(straightAnimationTwoTranslate.value),
                    child: CircleButton(
                      color: Colors.blue,
                      icon: Icon(Icons.email),
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: getDirectionInDegrees(straightRotation.value),
                  child: CircleButton(
                    color: Colors.orange,
                    icon: Icon(Icons.menu),
                    width: 60,
                    height: 60,
                    onTap: () {
                      if (straightController.status ==
                          AnimationStatus.completed) {
                        straightController.reverse();
                      } else {
                        straightController.forward();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: Transform.rotate(
                angle: logoRotation.value * 5,
                child: FlutterLogo(
                  size: 200.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset.fromDirection(getDirectionInDegrees(180),
                      translateAnimationOne.value * 100),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        getDirectionInDegrees(rotationAnimation.value))
                      ..scale(translateAnimationOne.value),
                    child: CircleButton(
                      icon: Icon(
                        Icons.camera,
                        color: Colors.white,
                      ),
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getDirectionInDegrees(225),
                      translateAnimationOTwo.value * 100),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        getDirectionInDegrees(rotationAnimation.value))
                      ..scale(translateAnimationOTwo.value),
                    child: CircleButton(
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      color: Colors.green,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getDirectionInDegrees(270),
                      translateAnimationThree.value * 100),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        getDirectionInDegrees(rotationAnimation.value))
                      ..scale(translateAnimationThree.value),
                    child: CircleButton(
                      icon: Icon(
                        Icons.print,
                        color: Colors.white,
                      ),
                      color: Colors.yellow,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(
                    getDirectionInDegrees(rotationAnimation.value),
                  ),
                  child: CircleButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    color: Colors.red,
                    width: 60,
                    height: 60,
                    onTap: () {
                      if (controller.status == AnimationStatus.completed) {
                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleButton extends StatelessWidget {
  Icon icon;
  Color color;
  Function onTap;
  double width;
  double height;

  CircleButton({this.icon, this.color, this.onTap, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: width,
      height: height,
      child: IconButton(icon: icon, onPressed: onTap),
    );
  }
}
