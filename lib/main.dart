import 'package:flutter/material.dart';
import 'package:wtasks/presentation/widgets/KBottomNavigationBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_route.dart';
import 'buisiness_logic/cuibits/BottomNavigationBarCubit.dart';
import 'constant/k_size.dart';


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
