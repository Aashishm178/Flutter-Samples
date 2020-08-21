import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('images/login.jpg'),
               fit: BoxFit.fitWidth,
               alignment: Alignment.topCenter
             )
           ),
         ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 270),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Padding(
              padding: EdgeInsets.all(23.0),
              child: ListView(
                children: <Widget>[
                  Text('Sign in',style: TextStyle(color: Colors.black,fontSize: 35.0,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'User name',
                          labelStyle: TextStyle(
                            fontSize: 15.0
                          ),
                          prefixIcon: Icon(Icons.person_outline,color: Colors.black,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          ),
                          )
                        ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 15.0
                            ),
                            prefixIcon: Icon(Icons.lock_outline,color: Colors.black,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.white
                                )
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      onPressed: (){},
                      color: Colors.pinkAccent,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('SIGN IN',style: TextStyle(color: Colors.white,fontSize: 15.0),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(child: Text('Forgot your password?',
                      style: TextStyle(color: Colors.black,fontSize: 15.0),)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Center(child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?' ,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 15.0
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){

                              }
                          )
                        ]
                      ),
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
