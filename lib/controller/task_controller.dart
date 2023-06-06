import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:to_do_list/model/task_model.dart';

class TaskController extends GetxController
{
  RxList<TaskModel>  tasks = <TaskModel>[
    TaskModel(title: "Hello India",notes: "Let's Learn\n\n\nFigma"),
    TaskModel(title: "Hello India",notes: "Let's Learn\ndfsdf\nsdfsdf\nFigma"),
  ].obs;

}