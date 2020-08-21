import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  static const String id = 'transform_screen';
  @override
  _TransformScreenState createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> rotate;
  Animation<double> scale;
  AnimationController controller;
  double x = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    rotate = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.2),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.2, end: -1.2),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -1.2, end: 0.0),
        weight: 25,
      ),
    ]).animate(controller);
    scale = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.5),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.5, end: 0.0),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 25,
      ),
    ]).animate(controller);
    controller.repeat();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                x = x + details.delta.dy / 100;
              });
            },
            onDoubleTap: () {
              if (controller.status == AnimationStatus.forward ||
                  controller.status == AnimationStatus.reverse) {
                controller.reset();
              } else {
                controller.repeat();
              }
              setState(() {
                x = 0;
              });
            },
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(x)
                ..rotateY(rotate.value)
                ..scale(scale.value)
                ..rotateZ(rotate.value),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Aashish Rathore',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    'Flutter Developer',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: CircleAvatar(
                    minRadius: 15,
                    maxRadius: 25,
                    backgroundColor: Colors.black54,
                    child: Text(
                      'A',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
