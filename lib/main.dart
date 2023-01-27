import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tribation_task/views/home/home_view.dart';

import 'view_models/home/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tribation Demo',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          fontFamily: "Roboto",
          primaryColor: Colors.orange.shade600),
          getPages: [
            GetPage(name: "/", page:()=> HomeView()),
            
          ],
      home: GetBuilder(
        init: HomeViewModel(),
        builder: (controller) {
          return const HomeView();
        }
      ),
    );
  }
}
