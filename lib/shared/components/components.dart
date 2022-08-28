import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

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
  bool isPassword = false,
  VoidCallback? onFormTap,
  IconData? sufficIcon,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validate,
        obscureText: isPassword,
        onTap: onFormTap,
        decoration: InputDecoration(
            labelText: text,
            border: OutlineInputBorder(),
            prefixIcon: Icon(iconData),
            suffixIcon: IconButton(
              icon: Icon(sufficIcon),
              onPressed: suffixPressed,
            )));



Widget taskItemRow(Map model,context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0),
    child: Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 38.00,
              backgroundColor: Colors.blue,
              child: Text(
                '${model['time']}',
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8.00,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model['title']}',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${model['date']}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          width: 30,
        ),
        IconButton(
          onPressed: () {
            AppCubit.get(context).updateTodoItem(status: 'done', id: model['id']);
          },
          icon: Icon(Icons.check_box),
          color: Colors.green,
        ),
        SizedBox(
          width: 15,
        ),
        IconButton(
          onPressed: () {
            AppCubit.get(context).updateTodoItem(status: 'archive', id: model['id']);
          },
          icon: Icon(Icons.archive),
          color: Colors.grey,
        ),
      ],
    ),
  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteTodoItem(id: model['id']);
  },
);
