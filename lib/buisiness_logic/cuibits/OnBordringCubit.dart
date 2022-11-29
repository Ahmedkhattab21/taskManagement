
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/widgets/customOnBordering.dart';
import '../task_states.dart';

class OnBordringCubit extends Cubit<TaskStates>{

  OnBordringCubit():super(InitialState());

  int currentPage = 0;
  PageController controller = PageController();
  List<Widget> pages = [
    const CustomOnBoarding(title: "Task,\nCalendar,\nChat", image: "assets/png/Ai2.png"),
    const CustomOnBoarding(title: "Work With\nTeam\nAnytime", image: "assets/png/Ai3.png"),
  ];

  changingPage(index) {
    currentPage = index;
    emit(OnPageChangedState());
  }


  static OnBordringCubit get(context)=>BlocProvider.of(context);
}