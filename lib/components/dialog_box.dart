import 'package:flutter/material.dart';
import 'package:to_do/components/task_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //Style Alert Dialog
      backgroundColor: Colors.yellow[200],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),

      content: Container(
        //Style Container
        height: 120,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Users input
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
              controller: controller,
            ),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Button save
                TaskButton(text: 'Save', onPressed: onSave),

                //Button cancel
                TaskButton(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
