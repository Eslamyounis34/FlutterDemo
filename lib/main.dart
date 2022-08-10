import 'package:flutter/material.dart';
import 'package:helloworldfutter/modules/bmi/bmi_screen.dart';
import 'package:helloworldfutter/modules/counter/counterScreen.dart';
import 'package:helloworldfutter/modules/login/login_screen.dart';
import 'package:helloworldfutter/modules/messenger/messenger_screen.dart';
import 'package:helloworldfutter/modules/simple_chat/simple_screen.dart';

void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: LoginScreen(),
    );
  }

}
