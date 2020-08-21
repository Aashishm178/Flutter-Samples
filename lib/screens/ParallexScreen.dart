import 'package:flutter/material.dart';

class Parallax extends StatefulWidget {
  static const String id = 'parallax_screen';
  @override
  _ParallaxState createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax> {
  ScrollController controller = ScrollController();
  double value = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        value = controller.offset / 160;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView.builder(
          controller: controller,
          itemCount: 20,
          itemBuilder: (context, index) {
            double scale = 1.0;
            if (value > 0.5) {
              scale = index + 0.5 - value;
              if (scale < 0)
                scale = 0;
              else if (scale > 1) scale = 1;
            }
            return Opacity(
              opacity: scale,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(scale, scale),
                child: Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
