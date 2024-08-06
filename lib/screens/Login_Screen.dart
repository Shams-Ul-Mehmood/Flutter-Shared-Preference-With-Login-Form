import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_with_login_screen/screens/Splash_Screen.dart';

import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState()
  {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // static const String LOGIN_KEY = "Login";

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        primary: true,
        title: Text("Login Screen", style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white ),),
        elevation: 8,
        centerTitle: true,
        titleSpacing: 8,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1,),
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar( backgroundColor: Colors.blue, radius: 57, child: Icon(Icons.account_circle, color: Colors.white, size: 115,),),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44),
                child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    // labelText: "Email",
                    label: Text("Email"),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44),
                child: TextField(
                  autofocus: true,
                  obscureText: true,
                  autocorrect: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    // labelText: "Password",
                    label: Text("Password"),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 35,),
              InkWell(
                autofocus: true,
                borderRadius: BorderRadius.circular(20),
                onTap: () async {

                  // If Successful LoggedIn ( Credentials are Corrects ).

                  var shared_Preferences = await SharedPreferences.getInstance();
                  var isLoggedIn = shared_Preferences.setBool(Splash_Screen_State.LOGIN_KEY, true);

                    if( isLoggedIn != false )
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
                      isLoggedIn = shared_Preferences.setBool(Splash_Screen_State.LOGIN_KEY, false);
                    }
                    else
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
                      isLoggedIn = shared_Preferences.setBool(Splash_Screen_State.LOGIN_KEY, true);
                    }
                                  },
                child: Container(
                  height: 50,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text("Login", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white ),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}