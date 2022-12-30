import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Container(
              color: Colors.red,
              child: const Text('Block 2'),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: const Text('Block 2'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
