import 'package:flutter/material.dart';

class Zadania extends StatefulWidget {
  const Zadania({Key? key}) : super(key: key);

  @override
  State<Zadania> createState() => _ZadaniaState();
}

class _ZadaniaState extends State<Zadania> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Witaj, Kamil',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30),
                  ),
                ),
                const Text(
                  'Sprawdź co dzisiaj musisz zrobić misiu :)',
                  style: TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}
