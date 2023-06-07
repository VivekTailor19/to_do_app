import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/model/task_model.dart';

import '../model/priority_model.dart';

class TaskController extends GetxController
{
  RxList<TaskModel>  tasks = <TaskModel>[
    TaskModel(title: "Hello India",notes: "Let's Learn\n\n\nFigma"),
    TaskModel(title: "Hello India",notes: "Let's Learn\ndfsdf\nsdfsdf\nFigma"),
  ].obs;



  List<PriorityModel> priorities = [
    PriorityModel(title: "High",value: "High",color: Colors.red.shade50),
    PriorityModel(title: "Medium",value: "Medium",color: Colors.yellow.shade50),
    PriorityModel(title: "Low",value: "Low",color: Colors.green.shade50),
  ];

  List pro = ["High","Medium","Low"];
  RxString selPriority = "High".obs;



  RxString date = "${DateTime.now()}".obs;

  String setDateFormat(DateTime dt)
  {
    var f = DateFormat("dd-MM-yyyy");
    return f.format(dt);
  }

  TimeOfDay time = TimeOfDay.now();
  void changetime(TimeOfDay t)
  {
    time = t;
    update();
  }



}