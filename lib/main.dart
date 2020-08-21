import 'package:flutter/material.dart';
import 'package:test_screens/screens/ClipScreen.dart';
import 'package:test_screens/screens/DrawerScreen.dart';
import 'package:test_screens/screens/FabButtonScreen.dart';
import 'package:test_screens/screens/PaintScreen.dart';
import 'package:test_screens/screens/ParallexScreen.dart';
import 'package:test_screens/screens/Screenshot.dart';
import 'package:test_screens/screens/SlideTransition.dart';
import 'package:test_screens/screens/SpringScreen.dart';
import 'package:test_screens/screens/TransformScreen.dart';
import 'screens/FoodScreen.dart';
import 'welcome.dart';
import 'screens/LoginScreen.dart';
import 'screens/Animation.dart';
import 'screens/TestAnimations.dart';
import 'screens/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String id = 'My_App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        FoodScreen.id: (context) => FoodScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        AnimationPage.id: (context) => AnimationPage(),
        TestAnimation.id: (context) => TestAnimation(),
        WidgetScreen.id: (context) => WidgetScreen(),
        FAbButtonScreen.id: (context) => FAbButtonScreen(),
        DrawerScreen.id: (context) => DrawerScreen(),
        ClipScreen.id: (context) => ClipScreen(),
        ScreenShot.id: (context) => ScreenShot(),
        TransformScreen.id: (context) => TransformScreen(),
        PaintScreen.id: (context) => PaintScreen(),
        SlideTransitionPage.id: (context) => SlideTransitionPage(),
        Parallax.id: (context) => Parallax(),
        SpringScreen.id: (context) => SpringScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
