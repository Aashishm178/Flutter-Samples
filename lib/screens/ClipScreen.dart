import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipScreen extends StatefulWidget {
  static const String id = 'clip_screen';
  @override
  _ClipScreenState createState() => _ClipScreenState();
}

class _ClipScreenState extends State<ClipScreen> {
  String selection = 'ribbon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Wrap(
                spacing: 20.0,
                direction: Axis.horizontal,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        selection = 'ribbon';
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Yellow Ribbon',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        selection = 'triangle';
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Yellow Triangle',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        selection = 'window';
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Yellow Window',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: MyClipper(
                select: selection,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow,
                      Colors.yellow.shade800,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  String select;
  MyClipper({this.select});
  @override
  Path getClip(Size size) {
    Path yellowRibbon = Path();
    yellowRibbon.lineTo(0.0, size.height);
    yellowRibbon.lineTo(size.width / 2, size.height / 2);
    yellowRibbon.lineTo(size.width, size.height);
    yellowRibbon.lineTo(size.width, 0.0);
    yellowRibbon.close();
    Path triangle = Path();
    print(size.width);
    print(size.height);
    triangle.moveTo(size.width / 2, 0.0);
    triangle.lineTo(0.0, size.height);
    triangle.lineTo(size.width, size.height);
    triangle.close();
    Path window = Path();
    window.lineTo(0.0, size.height);
    window.quadraticBezierTo(
        size.width / 8, 3 * size.height / 4, size.width / 4, size.height);
    window.quadraticBezierTo(
        3 * size.width / 8, 3 * size.height / 4, size.width / 2, size.height);
    window.quadraticBezierTo(5 * size.width / 8, 3 * size.height / 4,
        3 * size.width / 4, size.height);
    window.quadraticBezierTo(
        7 * size.width / 8, 3 * size.height / 4, size.width, size.height);
    window.lineTo(size.width, 0.0);
    window.close();
    if (select == 'ribbon') {
      return yellowRibbon;
    } else if (select == 'triangle') {
      return triangle;
    } else if (select == 'window') {
      return window;
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
