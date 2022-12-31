import 'package:flutter/material.dart';
import 'modules/list_tasks.dart';

class Zadania extends StatefulWidget {
  const Zadania({Key? key}) : super(key: key);

  @override
  State<Zadania> createState() => _ZadaniaState();
}

class _ZadaniaState extends State<Zadania> with SingleTickerProviderStateMixin {
  bool selected = false;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween<double>(begin: -200, end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: Transform.translate(
              offset: Offset(animation.value, 0),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'Witaj, Kamil',
                  style: TextStyle(
                      fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            )),
          ],
        ),
        const TaskList(),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                color: Colors.green,
                child: const Text('Block 2'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
