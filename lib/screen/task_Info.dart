import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/model/task_model.dart';

import '../controller/task_controller.dart';

class Task_Info extends StatefulWidget {
  const Task_Info({Key? key}) : super(key: key);

  @override
  State<Task_Info> createState() => _Task_InfoState();
}

class _Task_InfoState extends State<Task_Info> {
  Map mp = {};

  @override
  void initState() {
    mp = Get.arguments;

    if(mp['status'] == "edit")
      {
        TaskModel tm = mp['data'];
        txttitle = TextEditingController(text: tm.title);
        txtnotes = TextEditingController(text: tm.notes);
      }

    super.initState();
  }


  TextEditingController txttitle = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TaskController control = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txttitle,
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(maxLines: 5,
                controller: txtnotes,
                decoration: InputDecoration(
                    label: Text("Notes"),
                  border: OutlineInputBorder()
                ),
              ),
              Spacer(),
              ElevatedButton(onPressed: () {

                if(mp['status'] == 'add')
                  {
                    TaskModel task = TaskModel(title: txttitle.text,notes: txtnotes.text);
                    control.tasks.add(task);
                  }
                else
                  {
                    TaskModel task = TaskModel(title: txttitle.text,notes: txtnotes.text);
                    control.tasks[mp['index']] = task;
                  }

                Get.back();
              }, child: Text(mp['status'] == 'add'?"Add":"Update"))
            ],
          ),
        ),

      ),
    );
  }
}
