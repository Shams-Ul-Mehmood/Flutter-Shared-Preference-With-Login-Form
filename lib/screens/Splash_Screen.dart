import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Screen.dart';
import 'Login_Screen.dart';

class Splash_Screen extends StatefulWidget
{
  @override
  State<Splash_Screen> createState() => Splash_Screen_State();
}

class Splash_Screen_State extends State<Splash_Screen>
{
  static final String LOGIN_KEY = "Login";

  @override
  void initState()
  {
    super.initState();
    whereToGo();
  }

  void whereToGo() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPreferences.getBool(LOGIN_KEY);

    Timer( Duration( seconds: 3 ), () {

      if( isLoggedIn != null )
        {
          if( isLoggedIn )
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(), ));
            }
          else
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(), ));
            }
        }
      else
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(), ));
        }
    }, );
  }

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 620,
          child: Icon(Icons.account_circle, color: Colors.white, size: 245,),
        ),
      ),
    );
  }
}