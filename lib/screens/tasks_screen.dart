import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final int _selectedIndex = 0;
  void _onItemTapped(int index, BuildContext context) {
    if (index == 1) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: const Color.fromARGB(255, 30, 30, 30),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: const TextStyle(
                    color: Colors
                        .yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white, //<-- add this
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: (int index) {
            _onItemTapped(index, context);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Zadania',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Dodaj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Color.fromARGB(255, 255, 255, 255)),
              label: 'Profil',
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 40.0, left: 30.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Witaj, ANS',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Liczba zadań: ${Provider.of<TaskData>(context).taskCount} ',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 45, 45, 45),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
