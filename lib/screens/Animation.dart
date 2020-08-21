import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_screens/animations/FadeAnimation.dart';
import 'package:test_screens/screens/FoodScreen.dart';

class AnimationPage extends StatefulWidget {
  static const String id ='animation_page';
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with TickerProviderStateMixin{

  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController =AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
    _scaleAnimation = Tween<double>(begin: 1.0,end: 0.8).animate(_scaleController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _widthController.forward();
      }
    });

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );
    _widthAnimation = Tween<double>(begin: 80,end: 300).animate(_widthController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _positionController.forward();
      }
    });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    _positionAnimation = Tween<double>(begin: 0.0,end: 215.0).animate(_positionController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        setState(() {
          hideIcon = true;
        });
        _scale2Controller.forward();
      }
    });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    _scale2Animation = Tween<double>(begin: 1.0,end: 32.0).animate(_scale2Controller)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.push(context, PageTransition(type: PageTransitionType.fade,child: FoodScreen()));}
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 8,
              child: FadeAnimation(delay: 1,child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/one.png'),
                    fit: BoxFit.cover
                  )
                ),
              )),
            ),
            Positioned(
              top: -100,
              left: 8,
              child: FadeAnimation(delay: 1.3,child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              )),
            ),
            Positioned(
              top: -150,
              left: 8,
              child: FadeAnimation(delay: 1.6,child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/one.png'),
                        fit: BoxFit.cover
                    )
                ),
              )),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(delay: 1,child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 40.0),),),
                  SizedBox(height: 15.0,),
                  FadeAnimation(delay: 1.3,child: Text('Its Aashish',style: TextStyle(color: Colors.white.withOpacity(0.7),),),),
                  SizedBox(height: 180.0,),
                  FadeAnimation(delay: 1.6,child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context,child) => Transform.scale(scale: _scaleAnimation.value,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _widthController,
                        builder: (context,child) => Container(
                          height: 80.0,
                          width: _widthAnimation.value,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.blue.withOpacity(0.4),
                          ),
                          child: InkWell(
                            onTap: (){
                              _scaleController.forward();
                            },
                            child: Stack(
                              children: <Widget>[
                                AnimatedBuilder(
                                  animation: _positionController,
                                  builder: (context,child) => Positioned(
                                    left: _positionAnimation.value,
                                    child: AnimatedBuilder(
                                      animation: _scale2Controller,
                                      builder: (context,child) => Transform.scale(
                                        scale: _scale2Animation.value,
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle
                                        ),
                                        child: hideIcon == false ? Icon(Icons.arrow_forward,color: Colors.white,) : Container(),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                  ),),
                  SizedBox(height: 60.0 ,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
