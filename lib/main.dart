
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme()
      ),
      home: LoginScreen(),
    );
  }

}