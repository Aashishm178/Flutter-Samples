import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

// ignore: must_be_immutable
class ScreenShot extends StatelessWidget {
  static const String id = 'screen_shot';
  GlobalKey paint = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RepaintBoundary(
              key: paint,
              child: Container(
                padding: EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.grey,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'AASHISH RATHORE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Flutter Developer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '22',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'aashishc901@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '8826489700',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: FlatButton(
                color: Colors.black,
                onPressed: () async {
                  RenderRepaintBoundary boundary =
                      paint.currentContext.findRenderObject();
                  ui.Image img = await boundary.toImage();
                  ByteData byteData =
                      await img.toByteData(format: ui.ImageByteFormat.png);
                  Uint8List list = byteData.buffer.asUint8List();
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      enableDrag: true,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.transparent,
                          alignment: Alignment.topCenter,
                          height: Platform.isWindows
                              ? img.height.toDouble() + 300
                              : img.height.toDouble() + 150,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.memory(list).image,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'CAPTURED SCREENSHOT',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Capture',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
