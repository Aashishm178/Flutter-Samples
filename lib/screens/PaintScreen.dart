import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintScreen extends StatefulWidget {
  static const String id = 'PaintScreen';
  @override
  _PaintScreenState createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  double sliderValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          'Painter',
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 200 * sliderValue,
              height: 200 * sliderValue,
              child: CustomPaint(
                painter: MyPainter(),
              ),
            ),
            Slider(
                min: 1.0,
                max: 2.0,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Text(
                    'Height : ${(200 * sliderValue).toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Width : ${(200 * sliderValue).toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint bigRectPaint = Paint();
    canvas.scale(1.0);
    bigRectPaint = Paint()..color = Colors.blue;
    paint
      ..color = Colors.white
      ..isAntiAlias = true;
    canvas.drawCircle(Offset(size.height / 2, size.height / 2), size.height / 2,
        bigRectPaint);
    canvas.drawCircle(
        Offset(size.height / 2, size.height / 2), size.height / 3, paint);
    Paint mouthPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    Paint eyePaint = Paint()..color = Colors.black;
    Paint nosePaint = Paint()..color = Colors.pink;
    canvas.drawCircle(Offset(size.height * 0.416, size.height * 0.33),
        size.height * 0.033, eyePaint);
    canvas.drawCircle(Offset(size.height * 0.583, size.height * 0.33),
        size.height * 0.033, eyePaint);
    canvas.drawCircle(Offset(size.height * 0.50, size.height * 0.50),
        size.height * 0.033, nosePaint);
    canvas.drawArc(
        Rect.fromCenter(
          width: size.height * 0.166,
          height: size.height * 0.166,
          center: Offset(size.height * 0.50, size.height * 0.60),
        ),
        0,
        pi,
        false,
        mouthPaint);
    canvas.drawCircle(Offset(size.height * 0.066, size.height * 0.033),
        size.height * 0.133, paint);
    canvas.drawCircle(Offset(size.height * 0.934, size.height * 0.033),
        size.height * 0.133, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
