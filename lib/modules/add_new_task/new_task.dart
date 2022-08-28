import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworldfutter/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var tasks = cubit.tasks;
        return BuildCondition(
          condition: tasks.length > 0,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    taskItemRow(cubit.tasks[index], context),
                separatorBuilder: (context, index) => Container(
                      height: 2.00,
                      color: Colors.grey[200],
                    ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: cubit.tasks.length),
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu,size: 100,),
                Text(
                  "No Tasks Yet",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
