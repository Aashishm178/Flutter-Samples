import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {

  static const String id = 'widget_screen';

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> with TickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this
    );
    animation = Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller,curve: Curves.decelerate));
  }

  void _showDialog(){
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Alert Dialog'),
        content: Text('Body'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Ok'),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Widgets',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Builder(
            builder: (BuildContext context){
             return Padding(
               padding:  EdgeInsets.all(8.0),
               child: RawMaterialButton(
                 onPressed: (){
                   Scaffold.of(context).showSnackBar(SnackBar(
                     content: Text('Hi its a snackbar '),
                     animation: animation,
                     action: SnackBarAction(
                       label: 'ok',
                       onPressed: (){},
                     ),
                   ));
                 },
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius:BorderRadius.circular(20.0)
                   ),
                   child: Padding(
                     padding:  EdgeInsets.all(20.0),
                     child: Text('Snackbar',style: TextStyle(fontSize: 30.0,color: Colors.black),),
                   ),
                 ),
               ),
             );}
          ),
          Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: RawMaterialButton(
                    onPressed: _showDialog,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(20.0),
                        child: Text('Alert Dialog',style: TextStyle(fontSize: 30.0,color: Colors.black),),
                      ),
                    )
                  ),
          )
        ],
      ),
    );
  }
}
