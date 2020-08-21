import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  static const String id = 'drawer_screen';
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(2 *
                    MediaQuery.of(context).size.width /
                    3 *
                    controller.value),
              alignment: Alignment.centerLeft,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.yellow,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        iconSize: 30.0,
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          controller.isDismissed
                              ? controller.forward()
                              : controller.reverse();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
