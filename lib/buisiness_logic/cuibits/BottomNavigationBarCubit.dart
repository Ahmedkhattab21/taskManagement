import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/screens/home.dart';
import '../../presentation/screens/profileInfo.dart';
import '../task_states.dart';

class BottomNavigationBarCubit extends Cubit<TaskStates>{
  BottomNavigationBarCubit():super(InitialState());

  int currentIndex = 0;

  final List<Widget> bottomNavPages = [
    // HomeScreen(),
    // ProfileScreen(hideBackButton: true),
    HomeScreen(),
    Profile()
  ];

  setCurrentIndex(int navIndex){
    currentIndex = navIndex;
    emit(ChangeCurrentIndexState());
  }


  static BottomNavigationBarCubit get(context)=>BlocProvider.of(context);
}