import 'package:flutter/material.dart';
import 'package:shared_preferences_with_login_screen/screens/Splash_Screen.dart';

class Shared_Preferences_With_Login_Form_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.deepPurple,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      title: "Shared Preferences With Login Form",
      home: Splash_Screen(),
    );
  }
}