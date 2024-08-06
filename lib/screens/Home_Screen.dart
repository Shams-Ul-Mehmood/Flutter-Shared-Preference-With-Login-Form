import 'package:flutter/material.dart';
import 'package:shared_preferences_with_login_screen/screens/Login_Screen.dart';

class HomeScreen extends StatefulWidget
{
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
{
  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        primary: true,
        backgroundColor: Colors.blue,
        titleSpacing: 6,
        centerTitle: true,
        elevation: 6,
        title: Text("Home Screen", style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white ),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue.shade200,
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
              }, child: Icon(Icons.logout, color: Colors.white.withOpacity(0.5), size: 50,),),
              Icon(Icons.home, color: Colors.blue.withOpacity(0.5), size: 500,),
            ],
          ),
        ),
      ),
    );
  }
}