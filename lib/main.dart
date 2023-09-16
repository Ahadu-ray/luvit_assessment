import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit_assessment/core/services/firebase_services/firebase_options.dart';
import 'package:luvit_assessment/shared/routes/app_pages.dart';
import 'package:luvit_assessment/shared/routes/app_routes.dart';
import 'package:luvit_assessment/ui/bindings/home_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: AppPages.pages,
      initialBinding: HomeBinding(),
      initialRoute: AppRoutes.home,
    );
  }
}
