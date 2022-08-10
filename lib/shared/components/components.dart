import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
  required Color background,
  required String btnText,
 required VoidCallback function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: background,

      ),
      child: MaterialButton(
        onPressed: function,

        child: Text(
          '${btnText}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
