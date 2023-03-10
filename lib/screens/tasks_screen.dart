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
  void _onItemTapped(int index, BuildContext context) {
    if (index == 0) {
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
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profil()),
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
                Text(
                  'Witaj, ${Provider.of<TaskData>(context).profileName}',
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
                  'Liczba zada??: ${Provider.of<TaskData>(context).taskCount} ',
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

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);
  void _onItemTapped(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TasksScreen()),
    );
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
              icon: Icon(Icons.keyboard_return,
                  color: Color.fromARGB(255, 255, 255, 255)),
              label: 'Cofnij',
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
                  'Profil',
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
                  'Edytuj lub zmie??',
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
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 40, 40, 40),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextFormField(
                    initialValue: Provider.of<TaskData>(context).profileName,
                    onChanged: (text) {
                      Provider.of<TaskData>(context, listen: false)
                          .setName(text);
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                      fillColor: Colors.grey,
                      hintText: 'Wpisz imi??',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
