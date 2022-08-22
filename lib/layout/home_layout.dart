import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworldfutter/modules/add_new_task/new_task.dart';
import 'package:helloworldfutter/modules/archived_tasks/archived_task.dart';
import 'package:helloworldfutter/modules/done_tasks/done_tasks.dart';
import 'package:helloworldfutter/shared/components/components.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [NewTaskScreen(), DoneTasks(), ArchivedTasks()];
  List<String> titles = ['Tasks', 'Done', 'Archived'];
  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var isBottomSheetShown = false;
  var fabIcon = Icons.edit;
  var titeController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if (formKey.currentState!.validate()) {
              insertToDataBase(
                      titeController.text.toString(),
                      timeController.text.toString(),
                      dateController.text.toString())
                  .then((value) {
                print("Added Successfully");
              });
              Navigator.pop(context);
              isBottomSheetShown = false;

              setState(() {
                fabIcon = Icons.edit;
                getTasksList(database).then((value) {
                  tasks=value;
                });
              });

            }
          } else {
            setState(() {
              fabIcon = Icons.add;
            });
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
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
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
                                              DateFormat.yMMMd().format(value!);
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
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            isBottomSheetShown = true;
          }
        },
        child: Icon(fabIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 30,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            getTasksList(database).then((value) {
              tasks=value;
            });
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived')
        ],
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY  , title TEXT , date TEXT , time TEXT , status TEXT )')
          .then((value) {
        print('Table Created');
      }).catchError((onError) {
        print('failed to create table');
      });
    }, onOpen: (database) {
      getTasksList(database).then((value) {
        setState(() {
          tasks = value;

        });
      });
      print("DataBase Opened");
    });
  }

  Future insertToDataBase(
      @required title, @required time, @required date) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Tasks (title , date , time , status) VALUES ("$title" , "$date","$time","new")')
          .then((value) {
        print('item inserted');
      }).catchError((onError) {
        print('failed to insert row');
      });
    });
  }

  Future<List<Map>> getTasksList(database) async {
    return await database.rawQuery('SELECT * FROM Tasks');
  }
}
