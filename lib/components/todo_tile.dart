import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  
  const ToDoTile(
    {
    required this.taskName, 
    required this.isDone,
    required this.onChanged,
    required this.deleteFunction,
    super.key, 
    }
  );

  final String taskName;
  final bool isDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),

      //Slidable
      child: Slidable(

        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ]
        ),


        //Container
        child: Container(
        
          //Style Elementos do Container
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.all(24),
        
          //Elementos do Container -> Row para definir subelementos em linha
          child: Row(
            children: [
        
              //Checkbox
              Checkbox(
                value: isDone, 
                onChanged: onChanged,
                //Style
                activeColor: Colors.black,
              ),
        
              //Task
              Text(
                taskName,
                //Style
                style: TextStyle(
                  decoration: isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                ),
              ),
              
            ],
          ),
        
        ),
      ),
    );
  }
}