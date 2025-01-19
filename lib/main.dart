import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x5registrationpage/Routes/AppPage.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';
import 'package:x5registrationpage/Views/Registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Registration App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.login,
      getPages: AppPage.pages,
      home: Registration(),
    );
  }
}
