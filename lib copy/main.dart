import 'package:flutter/material.dart';
import 'zadania.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Zadania(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YourBussines",
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(21, 21, 21, 1),
        body: _pages.elementAt(_selectedIndex), //New

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Zadania',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Dodaj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped, //New
        ),
      ),
    );
  }
}
