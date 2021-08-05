import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ha2/meteo/home/home_binding.dart';
import 'package:ha2/meteo/home/home_screen.dart';

void main() {
  runApp(AppControl());
}

class AppControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
