import 'package:flutter/material.dart';

Color priorityColor(String p){

  switch(p){

    case "Alta":
      return Colors.red;

    case "Média":
      return Colors.orange;

    default:
      return Colors.green;
  }
}