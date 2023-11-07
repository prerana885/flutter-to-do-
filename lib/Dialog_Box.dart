import 'package:flutter/material.dart';
import '../My_Button.dart';
class DialogBox extends StatelessWidget {
final controller;
VoidCallback onSave;
VoidCallback onCancel;
 DialogBox({
   super.key,
   required this.onSave,
   required this.onCancel,
   required this.controller,
 });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellowAccent,
      content: Container(
      height: 128,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller:controller ,
            decoration: InputDecoration(border:OutlineInputBorder(),
              hintText: "add a new task",
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 8),
              MyButton(text:"Cancel", onPressed: onCancel),

            ],
          )
        ],

        )
    ),
    );
  }
}



