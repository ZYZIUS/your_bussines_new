import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final dynamic checkboxCallback;
  final dynamic longPressCallback;

  // dynamic checkboxCallback(bool? checkboxState) {
  //   setState(() {
  //     isChecked = checkboxState!;
  //   });
  // }

  // ignore: use_key_in_widget_constructors
  const TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 55, 55, 55),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: ListTile(
          onLongPress: longPressCallback,
          title: Text(
            taskTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Transform.scale(
            scale: 2,
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.green,
                shape: const CircleBorder(),
                value: isChecked,
                onChanged: checkboxCallback,
              ),
            ),
          ),
          trailing: MaterialButton(
              onPressed: longPressCallback,
              child: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.grey,
              )),
        ));
  }
}
