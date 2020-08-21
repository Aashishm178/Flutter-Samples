import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class TestAnimation extends StatefulWidget {
  static const String id= 'test_animation_screen';
  @override
  _TestAnimationState createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation> with TickerProviderStateMixin{

  Animation animation;
  Animation<double> scaleAnimation;
  Animation<double> translation;
  Animation<double> rotation;
  AnimationController animationController;
  AnimationController animationController2;
  AnimationController scaleController;
  bool _selected = false;
  bool menu_pressed = false;
  double size = 40;
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      boxShadow: [BoxShadow(
        color: Color(0x66000000),
        blurRadius: 10.0,
      )]
    ),
    end: BoxDecoration(
      color: Colors.blue[800],
      borderRadius: BorderRadius.circular(20.0),
      shape: BoxShape.rectangle
    )
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4)
    )..repeat();
    animation = Tween(begin: 0, end: 2*pi).animate(animationController);
    animationController2 = AnimationController(
      vsync: this,
        duration: Duration(seconds: 5)
    );
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900)
    );
    scaleAnimation = Tween<double>(begin: 1.5,end: 0.0).
    animate(CurvedAnimation(parent: scaleController,curve: Curves.fastOutSlowIn));
    translation = Tween<double>(begin: 0.0,end: 100.0).
    animate(CurvedAnimation(parent: scaleController,curve: Curves.elasticInOut));
    rotation = Tween<double>(begin: 0.0,end: 360.0).
    animate(CurvedAnimation(parent: scaleController,curve: Interval(0.0,0.7,curve: Curves.decelerate)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    animationController2.dispose();
    scaleController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    Widget _buildButton(double angle,{Color color,IconData iconData}){
      return Transform(
        transform: Matrix4.identity()..translate((translation.value)*cos(radians(angle)),(translation.value)*sin(radians(angle))),
          child: RawMaterialButton(
            fillColor: color,
            shape: CircleBorder(),
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Icon(iconData,color: Colors.white,),
            ),
            onPressed: (){
              scaleController.reverse();
            },
          ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Animation'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.lightBlueAccent,
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        _selected =! _selected;
                        if(size == 40){
                          size = 50;
                        }else if(size == 50){
                          size = 40;
                        }
                        if(animationController2.status == AnimationStatus.completed){
                          animationController2.reverse();
                        }else
                        animationController2.forward();
                      });
                    },
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Text('Start Animations',style: TextStyle(fontSize: 30.0,color: Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Column(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context,child) => Transform.rotate(
                          angle: animationController.value,
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selected ? Colors.blue[800] : Colors.blue,
                          ),
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOutBack,
                          child: Padding(
                            padding:  EdgeInsets.all(20.0),
                            child: FlutterLogo(size:_selected ? 200 : 100 ,),
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: menu_pressed ? 150.0 : 20.0),
                      child: AnimatedBuilder(
                          animation: scaleController,
                          builder: (context,child) =>
                              Transform.rotate(angle: radians(rotation.value),child:Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  _buildButton(0,color: Colors.red,iconData: Icons.check),
                                  _buildButton(45,color: Colors.green,iconData: Icons.repeat),
                                  _buildButton(90,color: Colors.orange,iconData: Icons.file_download),
                                  _buildButton(135,color: Colors.blue,iconData: Icons.ac_unit),
                                  _buildButton(180,color: Colors.black,iconData: Icons.arrow_forward),
                                  _buildButton(225,color: Colors.indigo,iconData: Icons.lock),
                                  _buildButton(270,color: Colors.pink,iconData: Icons.update),
                                  _buildButton(315,color: Colors.yellow,iconData: Icons.filter_list),
                                  Transform.scale(scale: scaleAnimation.value - 1.5 ,child:
                                  RawMaterialButton(
                                    fillColor: Colors.blue,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.check_box_outline_blank,color: Colors.white,size: 20.0,),
                                    ),
                                    onPressed: (){
                                      scaleController.reverse();
                                      setState(() {
                                        if(scaleController.status == AnimationStatus.reverse)
                                        menu_pressed = ! menu_pressed;
                                      });
                                    },
                                  )
                                  ),
                                  Transform.scale(scale: scaleAnimation.value,child:
                                  RawMaterialButton(
                                    fillColor: Colors.blue,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Icon(Icons.add,color: Colors.white,size: 20.0,),
                                    ),
                                    onPressed: (){
                                      scaleController.forward();
                                      setState(() {
                                        if(scaleController.status == AnimationStatus.forward)
                                        menu_pressed = ! menu_pressed;
                                      });
                                    },
                                  ),)
                                ],
                              ),)
                      ),
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0),
                      secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
                      crossFadeState: _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    AnimatedDefaultTextStyle(
                      child: Text('Flutter'),
                      duration: Duration(milliseconds: 500),
                      style:
                      _selected ? TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 40.0)
                      :TextStyle(fontSize: 50.0,color: Colors.blue,fontWeight: FontWeight.bold),
                      curve: Curves.elasticInOut,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                   AnimatedSize(
                     alignment: Alignment.center,
                     curve: Curves.bounceInOut,
                     duration: Duration(milliseconds: 500),
                     child: Text('Hello',style: TextStyle(fontSize: size ),),
                     vsync: this,
                   ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DecoratedBoxTransition(
                        decoration: decorationTween.animate(animationController2),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            child: FlutterLogo(size: 120,),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

