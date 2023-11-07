// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? DeleteFunction;

  ToDoTile({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.DeleteFunction,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: DeleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: Row(
                children: [
                  Checkbox(
                    value: taskcompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                  ),
                  //TASKNAME
                  Text(
                    taskname,
                    style: TextStyle(
                      decoration: taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ));
  }
}
//SizedBox(height: 10);
