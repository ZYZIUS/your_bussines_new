import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: Color.fromARGB(255, 30, 30, 30),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Dodaj zadanie',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: const Text(
                'Dodaj',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              textColor: Colors.black,
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
