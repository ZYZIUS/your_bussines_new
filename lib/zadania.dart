import 'package:flutter/material.dart';

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
        duration: const Duration(milliseconds: 700), vsync: this);
    animation = Tween<double>(begin: -200, end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 30, 30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Block 2'),
              ),
            ),
          ],
        ),
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
