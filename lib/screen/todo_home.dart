import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controller/task_controller.dart';

class ToDo_HomeScreen extends StatefulWidget {
  const ToDo_HomeScreen({Key? key}) : super(key: key);

  @override
  State<ToDo_HomeScreen> createState() => _ToDo_HomeScreenState();
}

class _ToDo_HomeScreenState extends State<ToDo_HomeScreen> {

  TaskController control = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("To Do",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.orange.shade400),),centerTitle:true,backgroundColor: Colors.white,),
        body: Obx(() => Column(
          children: [
            Expanded(
              child: ListView.builder(

                    itemCount: control.tasks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap:() {
                          control.tasks.removeAt(index);
                        },
                        onLongPress: () {
                          Get.toNamed("/taskinfo",arguments: {
                            "status":"edit",
                            "index":index,
                            "data":control.tasks[index]
                          });
                        },
                        child:TaskView(
                          title: control.tasks[index].title,
                          data: control.tasks[index].notes
                        )

                      );
                    },),
            ),
          ],
        ),
        ),

        floatingActionButton: FloatingActionButton(backgroundColor: Colors.orangeAccent,
          onPressed: () {
            Get.toNamed("/taskinfo",arguments: {"status":"add"});
          },
          child: Icon(Icons.add_task),
        ),
      ),
    );
  }

  Widget TaskView({String?title, String? data})
  {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(height: 200,width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        color: Colors.orange.shade50,
      ),

      child: Column(
        children: [
          Text("$title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
          Text("$data",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200),maxLines:3,overflow: TextOverflow.ellipsis,),
        ],
      ),),
    );
  }
}
