import 'package:get/get.dart';
import 'package:luvit_assessment/shared/routes/app_routes.dart';
import 'package:luvit_assessment/ui/pages/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    )
  ];
}
