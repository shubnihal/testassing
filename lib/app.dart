import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparxtittest/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sparx IT Test',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
