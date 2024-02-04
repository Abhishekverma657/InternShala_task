import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internshala_assignment/view/home_view.dart';
 class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
   void initState() {
    // TODO: implement initState
   Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  HomeView(),
        ),
      );
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Container(
       
       decoration: BoxDecoration(
         color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/internshala.png'))),
    );
  }
}