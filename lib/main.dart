import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment/view/home_view.dart';
import 'package:internshala_assignment/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return  GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


