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
        body: Obx(() => Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
                  itemCount: control.tasks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 200),
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
                      child: ListTile(
                        title: Text("${control.tasks[index].title}"),
                        subtitle: Text("${control.tasks[index].notes}",maxLines: 5,),
                      ),
                    );
                  },),
          ],
        ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/taskinfo",arguments: {"status":"add"});
          },
          child: Icon(Icons.add_task),
        ),
      ),
    );
  }
}
