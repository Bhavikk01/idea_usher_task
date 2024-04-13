import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/model/foot_step.dart';

class HomeController extends GetxController{
  final health = HealthFactory();
  RxList<FootSteps> footStep = <FootSteps>[].obs;
  Rx<int> totalFoot = 0.obs;
  Rx<double> totalCalori = 0.0.obs;
  bool haveGranted = false;


  @override
  Future<void> onReady() async {
    super.onReady();
    if(!await requestHealthPermissions()){
      haveGranted = await requestHealthPermissions();
    }else {
      await getFootSteep();
      await getCalorieData();
      haveGranted = false;
    }
    if(haveGranted){
      await getFootSteep();
      await getCalorieData();
      haveGranted = false;
    }
  }

  Future<bool> requestHealthPermissions() async {
    var status = await Permission.sensors.request();
    var status2 = await Permission.activityRecognition.request();
    return status == PermissionStatus.granted && status2 == PermissionStatus.granted;
  }

  Future<void> getFootSteep() async {
    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 1)),
          DateTime.now(),
          [HealthDataType.STEPS]
      );
      for(var footStep in healthData){
        if(DateTime(footStep.dateFrom.year,footStep.dateFrom.month,footStep.dateFrom.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
         || DateTime(footStep.dateTo.year,footStep.dateTo.month,footStep.dateTo.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))){
          totalFoot.value+=int.parse(footStep.value.toString());
        }
      }
      print('Total step today: $totalFoot');
    }
  }

  Future<void> getCalorieData() async {
    var results = await health.getHealthDataFromTypes(
      DateTime.now().subtract(const Duration(days: 1)),
      DateTime.now(),
      [HealthDataType.ACTIVE_ENERGY_BURNED],
    );
    for(var calori in results){
      if(DateTime(calori.dateFrom.year,calori.dateFrom.month,calori.dateFrom.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
          || DateTime(calori.dateTo.year,calori.dateTo.month,calori.dateTo.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))){
        totalCalori.value+=double.parse(calori.value.toString());
      }
    }
    print("Total calories: ${totalCalori.value}");
  }

}