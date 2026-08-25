import 'package:flutter/material.dart';

Color priorityColor(String p){

  switch(p){

    case "Alta":
      return const Color.fromARGB(255, 182, 127, 26);

    case "Média":
      return const Color.fromARGB(255, 122, 165, 23);

    default:
      return Colors.green;
  }
}