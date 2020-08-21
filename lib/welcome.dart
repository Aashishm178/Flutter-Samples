import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screens/screens/ClipScreen.dart';
import 'package:test_screens/screens/DrawerScreen.dart';
import 'package:test_screens/screens/FabButtonScreen.dart';
import 'package:test_screens/screens/FoodScreen.dart';
import 'package:test_screens/screens/PaintScreen.dart';
import 'package:test_screens/screens/ParallexScreen.dart';
import 'package:test_screens/screens/Screenshot.dart';
import 'package:test_screens/screens/SlideTransition.dart';
import 'package:test_screens/screens/SpringScreen.dart';
import 'package:test_screens/screens/TestAnimations.dart';
import 'package:test_screens/screens/TransformScreen.dart';
import 'package:test_screens/screens/widgets.dart';
import 'screens/LoginScreen.dart';
import 'screens/Animation.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Screens'),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.lightBlueAccent,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, FoodScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'FoodScreen',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Login Screen',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AnimationPage.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Animation',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.lightBlueAccent,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TestAnimation.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      ' Test Animation',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WidgetScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Widgets',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, FAbButtonScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'FabScreen',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DrawerScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Drawer',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ClipScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Clipper',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenShot.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Screenshot',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TransformScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Transform',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PaintScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Painter',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SlideTransitionPage.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Slide Animation',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Parallax.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Tile Animation',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SpringScreen.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Spring Animation',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
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
