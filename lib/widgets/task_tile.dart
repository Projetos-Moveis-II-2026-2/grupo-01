import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';
import '../utils/priority_colors.dart';
import '../screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget{

  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context){

    return ListTile(

      title:Text(task.title),

      subtitle:Text("${task.date.day}/${task.date.month}/${task.date.year}"),

      leading:CircleAvatar(

        backgroundColor:
        priorityColor(task.priority),

      ),

      trailing:Checkbox(

        value:task.completed,

        onChanged:(_){

          context
              .read<TaskProvider>()
              .toggleTask(task.id);

        },
      ),

      onTap:(){

        Navigator.push(

          context,

          MaterialPageRoute(

            builder:(_)=>EditTaskScreen(task:task),

          ),
        );
      },
    );
  }
}