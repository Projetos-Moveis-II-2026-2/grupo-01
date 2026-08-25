import 'package:flutter/material.dart';

Color priorityColor(String p){

  switch(p){

    case "Alta":
      return Colors.red;

    case "Média":
      return const Color.fromARGB(255, 80, 172, 134);

    default:
      return Colors.green;
  }
}