import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view_model/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Catatan Sederhana',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME,
      getPages: AppRoutes.pages,
    );
  }
}
