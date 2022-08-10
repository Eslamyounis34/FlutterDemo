import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int age;
  final double result;
  final bool isMale;

  BMIResultScreen({
    required this.age,
    required this.isMale,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              "Gender : ${ isMale ? 'Male' : 'Female'}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Result : ${result.toInt()}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Age : ${age}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
