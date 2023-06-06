import 'package:flutter/material.dart';

class TaskModel
{
  String? title,notes,priority;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  TaskModel({this.title, this.notes, this.priority,this.dateTime, this.timeOfDay});


}