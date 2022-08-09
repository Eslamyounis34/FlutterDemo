import 'package:flutter/material.dart';
import 'package:helloworldfutter/bmi_screen.dart';
import 'package:helloworldfutter/counterScreen.dart';
import 'package:helloworldfutter/home_screen.dart';
import 'package:helloworldfutter/login_screen.dart';
import 'package:helloworldfutter/messenger_screen.dart';
import 'package:helloworldfutter/simple_screen.dart';

void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: BmiCalculator(),
    );
  }

}
