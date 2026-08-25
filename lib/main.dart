import 'package:flutter/material.dart';

import 'providers/task_provider.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(

    ChangeNotifierProvider(

      create:(_)=>TaskProvider(),

      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(

      debugShowCheckedModeBanner:false,

      title:'Gerenciador',

      theme:ThemeData(

        colorSchemeSeed: Colors.red,

        useMaterial3:true,

      ),

      home:const HomeScreen(),
    );
  }
}