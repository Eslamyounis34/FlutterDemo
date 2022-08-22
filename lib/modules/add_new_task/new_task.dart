import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          itemBuilder: (context, index) => taskItemRow(tasks[index]),
          separatorBuilder: (context, index) => Container(
                height: 2.00,
                color: Colors.grey[200],
              ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tasks.length),
    );
  }

  Widget taskItemRow(Map model) => Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 12.0, bottom: 12.0),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40.00,
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
            )
          ],
        ),
      );
}
