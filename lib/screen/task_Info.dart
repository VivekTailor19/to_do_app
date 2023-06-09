import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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

    control.date.value = control.setDateFormat(DateTime.now());
    control.time.value = control.setTime(TimeOfDay.now());

    if (mp['status'] == "edit") {
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

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.done, size: 20.sp, color: Colors.white,),
          onPressed: () {
            if (mp['status'] == 'add') {
              TaskModel task = TaskModel(
                  title: txttitle.text,
                  notes: txtnotes.text,
                  dateTime: control.date.value,
                  priority: control.selPriority.value,
                  timeOfDay: control.time.value
              );
              control.tasks.add(task);
            }
            else {
              TaskModel task = TaskModel(
                  title: txttitle.text,
                  notes: txtnotes.text,
                  dateTime: control.date.value,
                  priority: control.selPriority.value,
                  timeOfDay: control.time.value
              );
              control.tasks[mp['index']] = task;
            }

            Get.back();
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(maxLines: 3,
                  controller: txttitle,
                  decoration: InputDecoration(
                      hintText: "Enter the title",
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
                TextField(maxLines: 6,
                  controller: txtnotes,
                  decoration: InputDecoration(
                      hintText: "Enter new task",
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),

                SizedBox(height: 15,),

                Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.grid_view_outlined, color: Colors.orangeAccent, size: 22.sp,),
                    SizedBox(width: 2.w,),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2.5.w),
                      height: 50,
                      width: 70.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 1))]
                      ),
                      child: Obx(() =>  DropdownButton(

                        hint: Text("Priority",style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300)),

                        underline: Container(),
                        iconSize: 0,

                        dropdownColor: Colors.white,

                        alignment: Alignment.center,
                        value: control.selPriority.value,

                        items:
                        control.pro.map((e) => DropdownMenuItem(child: Text("$e",style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300)),value: e,)).toList(),

                        onChanged: (value) {
                          control.selPriority.value= value as String;
                        },
                      ),
                      ),
                    ),
                  ],
                ),



                 GestureDetector(onTap: () async {
                      DateTime? pick = await showDatePicker(
                          context: Get.context!, initialDate: DateTime.now(),
                          firstDate: DateTime(2000),lastDate: DateTime(2025)
                      );
                      control.date.value = control.setDateFormat(pick!);
                    },
                      child: Obx(() => Button(title:
                        " ${control.date}",
                              icon: Icons.calendar_month_rounded),
                      ),
                      ),


                GestureDetector(onTap: () async {

                  TimeOfDay? pick = await showTimePicker(
                      context: Get.context!, initialTime: TimeOfDay.now()
                  );

                  control.time.value = control.setTime(pick!);


                },
                    child:
                     Obx(() => Button(title:
                    '${control.time}', icon: Icons.alarm_add_rounded),
                     )),







              ],
            ),


          ),
        ),
      ),


    );
  }

  Widget Button({String? title, IconData? icon}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.orangeAccent, size: 22.sp,),
        SizedBox(width: 2.w,),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.5.w),
          height: 50,
          width: 70.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 1))]
          ),
          child: Text("$title",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300)),
        ),
      ],
    );
  }

}
