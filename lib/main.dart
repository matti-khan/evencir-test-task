import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/app_theme.dart';
import 'views/dashboard_screen.dart';
import 'controllers/dashboard_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialBinding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
      home: const DashboardScreen(),
    );
  }
}
