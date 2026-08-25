import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  String search="";

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(

        title:const Text("Tarefas"),

        actions:[

          IconButton(

            icon:const Icon(Icons.history),

            onPressed:(){

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder:(_)=>const HistoryScreen(),

                ),
              );
            },
          )
        ],
      ),

      floatingActionButton:FloatingActionButton(

        child:const Icon(Icons.add),

        onPressed:(){

          Navigator.push(

            context,

            MaterialPageRoute(

              builder:(_)=>const AddTaskScreen(),

            ),
          );
        },
      ),

      body:Column(

        children:[

          Padding(

            padding:const EdgeInsets.all(12),

            child:TextField(

              decoration:const InputDecoration(

                prefixIcon:Icon(Icons.search),

                hintText:"Pesquisar",

                border:OutlineInputBorder(),
              ),

              onChanged:(v){

                setState(()=>search=v);
              },
            ),
          ),

          Expanded(

            child:Consumer<TaskProvider>(

              builder:(context,provider,_){

                final tasks=provider.activeTasks
                    .where((t)=>t.title
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                    .toList();

                return ListView.builder(

                  itemCount:tasks.length,

                  itemBuilder:(c,i){

                    return TaskTile(task:tasks[i]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}