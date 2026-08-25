import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class HistoryScreen extends StatelessWidget{

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(title:const Text("Histórico")),

      body:Consumer<TaskProvider>(

        builder:(context,provider,_){

          return ListView.builder(

            itemCount:provider.completedTasks.length,

            itemBuilder:(c,i){

              return TaskTile(

                task:provider.completedTasks[i],
              );
            },
          );
        },
      ),
    );
  }
}