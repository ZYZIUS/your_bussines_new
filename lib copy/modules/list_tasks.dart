import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  void _changeColor(int index) {
    print(index);
  }

  final List<String> items = ['item 1', 'item 2', 'item 3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 10; i++)
          Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () => {_changeColor(i)},
                      child: Container(
                        key: ValueKey(i),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(right: 15),
                        height: 50,
                        width: 50,
                        child: const Text('Block 2'),
                      ),
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
            ),
          )
      ],
    );
  }
}
