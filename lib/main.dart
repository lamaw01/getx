import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/views/home_page.dart';
import 'package:getx/views/shopping_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShoppingPage(),
      getPages: [
        GetPage(name: '/homePage', page: () => HomePage()),
      ],
    );
  }
}
