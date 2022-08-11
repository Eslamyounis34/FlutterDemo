import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworldfutter/modules/add_new_task/new_task.dart';
import 'package:helloworldfutter/modules/archived_tasks/archived_task.dart';
import 'package:helloworldfutter/modules/done_tasks/done_tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  List<Widget> screens = [NewTaskScreen(), DoneTasks(), ArchivedTasks()];
  List<String> titles = ['Tasks', 'Done', 'Archived'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 30,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived')
        ],
      ),
    );
  }
}
