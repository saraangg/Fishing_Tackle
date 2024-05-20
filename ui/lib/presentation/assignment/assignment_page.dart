import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/Listview_builder/listview_assignment.dart';
import '../bottomnav/bottomnav_controller.dart';
import 'assignment_controller.dart';

class Assignment extends StatelessWidget {
  Assignment({super.key});
  final BottomnavController bottomnavController = Get.put(BottomnavController());
  final AssignmentControllers controller = Get.put(AssignmentControllers());

  @override
  Widget build(BuildContext context) {
    // Prevent screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            bottomnavController.updateSelectedIndex(0);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'Assignment',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<AssignmentControllers>(
              builder: (_) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 320.h,
                  width: 550.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TableCalendar(
                    calendarFormat: controller.calendarFormat,
                    focusedDay: controller.focusedDay,
                    calendarStyle: CalendarStyle(),
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDay, day);
                    },
                    onDaySelected: controller.onDaySelected,
                    onFormatChanged: controller.onCalendarFormatChanged,
                    eventLoader: (day) {
                      return controller.events[day] ?? [];
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Assignments(10)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            CustomListview()
          ],
        ),
      ),
    );
  }
}
