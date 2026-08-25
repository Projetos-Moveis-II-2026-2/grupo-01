import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {

  final List<Task> _tasks = [];

  List<Task> get activeTasks =>
      _tasks.where((t) => !t.completed).toList();

  List<Task> get completedTasks =>
      _tasks.where((t) => t.completed).toList();

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){

    final index =
        _tasks.indexWhere((t)=>t.id==task.id);

    if(index!=-1){
      _tasks[index]=task;
      notifyListeners();
    }
  }

  void removeTask(String id){
    _tasks.removeWhere((t)=>t.id==id);
    notifyListeners();
  }

  void toggleTask(String id){

    final task =
        _tasks.firstWhere((t)=>t.id==id);

    task.completed=!task.completed;
    notifyListeners();
  }
}