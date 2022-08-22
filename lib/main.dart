import 'package:flutter/material.dart';
import 'package:helloworldfutter/layout/home_layout.dart';
import 'package:helloworldfutter/modules/add_new_task/new_task.dart';
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
      home: CounterScreen(),
    );
  }

}
