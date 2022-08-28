import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ArchivedTasks extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var archinedTasks = AppCubit.get(context).archivedTasks;

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  taskItemRow(archinedTasks[index], context),
              separatorBuilder: (context, index) => Container(
                    height: 2.00,
                    color: Colors.grey[200],
                  ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: archinedTasks.length),
        );
      },
    );
  }

}
