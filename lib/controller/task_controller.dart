import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:to_do_list/model/task_model.dart';

import '../model/priority_model.dart';

class TaskController extends GetxController
{
  RxList<TaskModel>  tasks = <TaskModel>[
    TaskModel(title: "Hello India",notes: "Let's Learn\n\n\nFigma"),
    TaskModel(title: "Hello India",notes: "Let's Learn\ndfsdf\nsdfsdf\nFigma"),
  ].obs;

  RxString selPriority = "High".obs;

  Rx<DateTime> d = DateTime.now().obs;
  Rx<TimeOfDay> t = TimeOfDay.now().obs;

  Rx<DateTime> pdate = DateTime(2015,3,1).obs;
  Rx<TimeOfDay> ptime = TimeOfDay(hour: 12, minute: 40).obs;

  List<PriorityModel> priorities = [
    PriorityModel(title: "High",value: "High",color: Colors.red.shade50),
    PriorityModel(title: "Medium",value: "Medium",color: Colors.yellow.shade50),
    PriorityModel(title: "Low",value: "Low",color: Colors.green.shade50),
  ];

}