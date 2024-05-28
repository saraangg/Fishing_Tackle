import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartwatch/smartwatch_controller.dart';

class DashboardPage extends StatelessWidget {
  final SmartwatchController controller = Get.put(SmartwatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smartwatch Dashboard'),
      ),
      body: Obx(() {
        if (controller.data.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final watch = controller.data[index];
            return Card(
              child: ListTile(
                title: Text(watch.name),
                subtitle: Text('Heart Rate: ${watch.heartRate} bpm\nSteps: ${watch.steps}'),
                trailing: Text(watch.timestamp.toString()),
              ),
            );
          },
        );
      }),
    );
  }
}