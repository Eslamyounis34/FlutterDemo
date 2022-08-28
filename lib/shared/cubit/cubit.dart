import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworldfutter/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/add_new_task/new_task.dart';
import '../../modules/archived_tasks/archived_task.dart';
import '../../modules/done_tasks/done_tasks.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  var isBottomSheetShown = false;
  var fabIcon = Icons.edit;
  late Database database;
  List<Widget> screens = [NewTaskScreen(), DoneTasks(), ArchivedTasks()];
  List<String> titles = ['Tasks', 'Done', 'Archived'];
  List<Map> tasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavigationBarState());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY  , title TEXT , date TEXT , time TEXT , status TEXT )')
          .then((value) {
        print('Table Created');
      }).catchError((onError) {
        print('failed to create table');
      });
    }, onOpen: (database) {
      getTasksList(database);
      print("DataBase Opened");
    }).then((value) {
      print(value);
      database = value;
      emit(AppCreateDBState());
    });
  }

  void updateTodoItem({required String status, required int id}) async {
    database.rawUpdate('UPDATE Tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value) {
      getTasksList(database);
      emit(AppUpdateItemDBState());
    });
  }

  void deleteTodoItem({required int id}) async {
    database.rawDelete(
        'DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      getTasksList(database);
      emit(AppDeleteItemDBState());
    });
  }

  Future insertToDataBase(
      {@required title, @required time, @required date}) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Tasks (title , date , time , status) VALUES ("$title" , "$date","$time","new")')
          .then((value) {
        getTasksList(database);
        print('item inserted');
        emit(AppInsertToDBState());
      }).catchError((onError) {
        print('failed to insert row');
      });
    });
  }

  void getTasksList(database) {
    tasks = [];
    doneTasks = [];
    archivedTasks = [];
    database.rawQuery('SELECT * FROM Tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          tasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archive') {
          archivedTasks.add(element);
        }
      });
      emit(AppGetItemsDBState());
    });
  }

  void changeBottomSheetState({required bool isShow, required IconData icon}) {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }
}
