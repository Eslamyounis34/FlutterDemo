import 'package:flutter/material.dart';
import 'package:helloworldfutter/home_screen.dart';
import 'package:helloworldfutter/login_screen.dart';

void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginScreen(),
    );
  }

}
