import 'package:flutter/material.dart';

import 'app_route.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( TaskManagement( appRoute : AppRoute()));
}

class TaskManagement extends StatelessWidget {
  AppRoute appRoute;
  TaskManagement({required this.appRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(fontFamily: 'Mulish'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute:appRoute.generateRoute,
    );
  }
}
