import 'package:flutter/material.dart';

class Zadania extends StatefulWidget {
  const Zadania({Key? key}) : super(key: key);

  @override
  State<Zadania> createState() => _ZadaniaState();
}

class _ZadaniaState extends State<Zadania> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'Witaj, Kamil',
                  style: TextStyle(
                      fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
                ),
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
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 30, 30),
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
}
