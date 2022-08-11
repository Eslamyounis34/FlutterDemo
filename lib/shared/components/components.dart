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

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String text,
  required IconData iconData,
  required String? validate(String? value),
  IconData? sufficIcon,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(),
          prefixIcon: Icon(iconData),
          suffixIcon: Icon(sufficIcon)),
    );
