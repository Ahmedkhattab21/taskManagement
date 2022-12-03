import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


import '../task_states.dart';
final List<Map<String,dynamic>> taskListModel = [
  {'title': 'Task Number 1', 'isSelected': false},
  {'title': 'Task Number 2', 'isSelected': false},
  {'title': 'Task Number 3', 'isSelected': false},
];
class TaskDetailsCubit extends Cubit<TaskStates>{
  TaskDetailsCubit():super(InitialState());

  MakeTaskChange(index){
    taskListModel[index]['isSelected'] = !taskListModel[index]['isSelected'];
    emit(ChangeTaskState());
  }

  static TaskDetailsCubit get(context)=>BlocProvider.of(context);

}