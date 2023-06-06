import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_list/screen/task_Info.dart';
import 'package:to_do_list/screen/todo_home.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(p0) => ToDo_HomeScreen(),
          "/taskinfo":(p0) => Task_Info(),

        },
      ),
    ),
  );
}
