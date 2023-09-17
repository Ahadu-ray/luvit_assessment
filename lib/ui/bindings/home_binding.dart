import 'package:get/get.dart';
import 'package:luvit_assessment/core/adapters/home_adapter.dart';
import 'package:luvit_assessment/core/repositories/home_repository.dart';
import 'package:luvit_assessment/core/services/firebase_services/realtime_db_service.dart';
import 'package:luvit_assessment/ui/controllers/home_controllers.dart';

// a class to declare the dependencies of the home screen
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RealTimeDatabaseService());
    Get.put<IHomeRepository>(
      HomeRepository(realTimeDatabaseService: Get.find()),
    );
    Get.lazyPut(() => HomeController(repository: Get.find()));
  }
}
