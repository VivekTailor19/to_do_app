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
                  title: txttitle.text, notes: txtnotes.text);
              control.tasks.add(task);
            }
            else {
              TaskModel task = TaskModel(
                  title: txttitle.text, notes: txtnotes.text);
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
                      label: Text("Enter the title"),
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

                Button(title: "Priority", icon: Icons.grid_view_outlined),

                 GestureDetector(onTap: () async{

                    control.pdate = ((await showDatePicker(context: Get.context!,

                        initialDate: control.d.value,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2050))) as Rx<DateTime>?)!;

                    if(control.pdate != null  && control.pdate !=control.d)
                      {
                        control.d.value = control.d.value;
                      }

                  },
                      child:  Button(title:

                      " ${control.d.value.day} / ${control.d.value.month} / ${control.d.value.year}",
                            icon: Icons.calendar_month_rounded),
                      ),


                GestureDetector(onTap: () async {

                  control.ptime = (await showTimePicker(context: Get.context!, initialTime: control.t.value)) as Rx<TimeOfDay>;


                  control.t.value = control.ptime.value;
                  print(control.t.obs);

                  },
                    child:  Obx(() =>  Button(title:
                    '${control.t.value.hour} : ${control.t.value.minute} ', icon: Icons.alarm_add_rounded))),





                DropdownButton(
                   hint: Text("Priority"),

                   icon: Icon(Icons.grid_view_outlined, size: 15.sp,
                     color: Colors.orangeAccent,),
                   underline: Container(),

                   dropdownColor: Colors.white,

                   alignment: Alignment.center,
                   value: control.selPriority,

                   items: [
                     DropdownMenuItem(child: Text("High"),value: "High"),
                     DropdownMenuItem(child: Text("Medium"), value: "Medium"),
                     DropdownMenuItem(child: Text("Low"), value: "Low"),

                   ],



                   onChanged: (value) {
                     control.selPriority = value as RxString;
                   },
                 ),

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
