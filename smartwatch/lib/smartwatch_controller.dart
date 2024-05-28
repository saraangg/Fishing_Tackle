import 'package:get/get.dart';
import 'models.dart';

class SmartwatchController extends GetxController {
  var data = <SmartwatchData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSmartwatchData();
  }

  void fetchSmartwatchData() {
    // Mock data fetching, replace this with actual API calls
    data.assignAll([
      SmartwatchData(id: '1', name: 'Watch 1', heartRate: 70, steps: 5000, timestamp: DateTime.now()),
      SmartwatchData(id: '2', name: 'Watch 2', heartRate: 65, steps: 7000, timestamp: DateTime.now()),
      // Add more data as needed
    ]);
  }
}