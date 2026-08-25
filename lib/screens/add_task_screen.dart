import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget{

  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState()=>_AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen>{

  final controller=TextEditingController();

  DateTime date=DateTime.now();

  String priority="Baixa";

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(title:const Text("Adicionar tarefa")),

      body:Padding(

        padding:const EdgeInsets.all(20),

        child:Column(

          children:[

            TextField(

              controller:controller,

              decoration:const InputDecoration(labelText:"Título"),
            ),

            const SizedBox(height:20),

            ListTile(

              title:Text(
                "${date.day}/${date.month}/${date.year}",
              ),

              trailing:const Icon(Icons.calendar_today),

              onTap:()async{

                final picked=await showDatePicker(

                  context:context,

                  firstDate:DateTime.now(),

                  lastDate:DateTime(2030),

                  initialDate:date,
                );

                if(picked!=null){

                  setState(()=>date=picked);
                }
              },
            ),

            DropdownButton<String>(

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

                context.read<TaskProvider>().addTask(

                  Task(

                    id:DateTime.now()
                        .millisecondsSinceEpoch
                        .toString(),

                    title:controller.text,

                    date:date,

                    priority:priority,
                  ),
                );

                Navigator.pop(context);
              },

              child:const Text("Adicionar"),
            )
          ],
        ),
      ),
    );
  }
}