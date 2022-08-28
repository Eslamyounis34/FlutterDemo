import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworldfutter/modules/add_new_task/new_task.dart';
import 'package:helloworldfutter/modules/archived_tasks/archived_task.dart';
import 'package:helloworldfutter/modules/done_tasks/done_tasks.dart';
import 'package:helloworldfutter/shared/components/components.dart';
import 'package:helloworldfutter/shared/cubit/cubit.dart';
import 'package:helloworldfutter/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/constants.dart';

class HomeScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var titeController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is AppInsertToDBState) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  cubit
                      .insertToDataBase(
                          title: titeController.text.toString(),
                          time: timeController.text.toString(),
                          date: dateController.text.toString())
                      .then((value) {
                    titeController.text = "";
                    timeController.text = "";
                    dateController.text = "";

                    print("Added Successfully");
                  });
                }
              } else {
                // setState(() {
                //   fabIcon = Icons.add;
                // });
                scaffoldKey.currentState!
                    .showBottomSheet(
                        (context) => Form(
                              key: formKey,
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      defaultTextField(
                                          controller: titeController,
                                          type: TextInputType.text,
                                          text: 'title',
                                          iconData: Icons.title,
                                          validate: (value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'Task Title is Empty';
                                            }
                                            return null;
                                          }),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextField(
                                          controller: timeController,
                                          type: TextInputType.name,
                                          text: 'Time',
                                          iconData: Icons.alarm,
                                          validate: (value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'Task Time is Empty';
                                            }
                                            return null;
                                          },
                                          onFormTap: () {
                                            showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                              timeController.text = value!
                                                  .format(context)
                                                  .toString();
                                            }).catchError((onError) {
                                              print(onError.toString());
                                            });
                                          }),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextField(
                                          controller: dateController,
                                          type: TextInputType.number,
                                          text: 'Date',
                                          iconData: Icons.date_range,
                                          validate: (value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'Task Date is Empty';
                                            }
                                            return null;
                                          },
                                          onFormTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.parse(
                                                        '2022-12-12'))
                                                .then((value) {
                                              dateController.text =
                                                  DateFormat.yMMMd()
                                                      .format(value!);
                                            });
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        elevation: 20.0)
                    .closed
                    .then((value) {
                  cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                });
                cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
              }
            },
            child: Icon(cubit.fabIcon),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 30,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              AppCubit.get(context).changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline), label: 'Done'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: 'Archived')
            ],
          ),
        );
      }),
    );
  }
}
