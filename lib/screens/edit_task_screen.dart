import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';

class EditTaskScreen extends StatefulWidget{

  final Task task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState()=>_EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen>{

  late TextEditingController controller;

  late DateTime date;

  late String priority;

  @override
  void initState(){

    controller=TextEditingController(
      text:widget.task.title,
    );

    date=widget.task.date;

    priority=widget.task.priority;

    super.initState();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(title:const Text("Editar tarefa")),

      body:Padding(

        padding:const EdgeInsets.all(20),

        child:Column(

          children:[

            TextField(controller:controller),

            const SizedBox(height:20),

            DropdownButton(

              value:priority,

              isExpanded:true,

              items:["Alta","Média","Baixa"]

                  .map((e)=>DropdownMenuItem(

                    value:e,

                    child:Text(e),

                  ))
                  .toList(),

              onChanged:(v){

                setState(()=>priority=v!);
              },
            ),

            const Spacer(),

            FilledButton(

              onPressed:(){

                context.read<TaskProvider>().updateTask(

                  Task(

                    id:widget.task.id,

                    title:controller.text,

                    date:date,

                    priority:priority,

                    completed:widget.task.completed,
                  ),
                );

                Navigator.pop(context);
              },

              child:const Text("Confirmar"),
            ),

            const SizedBox(height:10),

            FilledButton.tonal(

              onPressed:(){

                context
                    .read<TaskProvider>()
                    .removeTask(widget.task.id);

                Navigator.pop(context);
              },

              child:const Text("Excluir!!"),
            )
          ],
        ),
      ),
    );
  }
}