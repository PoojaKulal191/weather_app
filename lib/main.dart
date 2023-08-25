import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/select_location.dart';
import 'controller/app_initial_binding.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AppInitialBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SelectLocation());
  }
}