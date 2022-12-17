import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wtasks/presentation/screens/CreateProjectScreen.dart';
import 'package:wtasks/presentation/screens/CreateTaskScreen.dart';
import 'package:wtasks/presentation/screens/CreateTeamScreen.dart';
import 'package:wtasks/presentation/screens/LogInPassword.dart';
import 'package:wtasks/presentation/screens/OnBoardingScreen.dart';
import 'package:wtasks/presentation/screens/ProfileScreen.dart';
import 'package:wtasks/presentation/screens/SelectMemberScreen.dart';
import 'package:wtasks/presentation/screens/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtasks/presentation/screens/home.dart';
import 'package:wtasks/presentation/screens/loginScreen.dart';
import 'package:wtasks/presentation/screens/signUpScreen.dart';
import 'package:wtasks/presentation/screens/profileSetupScreen.dart';
import 'package:wtasks/presentation/widgets/KBottomNavigationBar.dart';

import 'buisiness_logic/bloc_observer.dart';
import 'buisiness_logic/cuibits/AuthCubit.dart';
import 'buisiness_logic/cuibits/OnBordringCubit.dart';
import 'buisiness_logic/cuibits/TaskDetailsCubit.dart';
import 'buisiness_logic/task_states.dart';
import 'constant/string.dart';
import 'data/repository/Repository.dart';
import 'data/web_services/web_services.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await Repository(WebServices()).getUsers();

  final pref = await SharedPreferences.getInstance();

  runApp( TaskManagement( repository : Repository(WebServices()),token: pref.getString("token"),));
}

class TaskManagement extends StatelessWidget {
  String? token;
  Repository repository;
  TaskManagement({required this.repository,this.token});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBordringCubit>(
          create: (BuildContext context) => OnBordringCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(repository)..currentIndexEqualZero(),
        ),
        BlocProvider<TaskDetailsCubit>(
          create: (BuildContext context) => TaskDetailsCubit(),
        ),
        BlocProvider<TaskDetailsCubit>(
          create: (BuildContext context) => TaskDetailsCubit(),
        ),
      ],
      child: BlocConsumer<AuthCubit,TaskStates>(
        listener: (context,states){},
        builder:(context,states) {
          // if()
          return MaterialApp(
              title: 'Task',
              theme:
          ThemeData(fontFamily: 'Mulish'),
          debugShowCheckedModeBanner: false,
           initialRoute:splashScreen,
          home: token==null?const SplashScreen():const KBottomNavigationBar(),
          routes: {
            onBoardingScreen:(_)=>OnBoardingScreen(),
            logInEmail:(_)=>LogInEmail(),
            logInPassword:(_)=>LogInPassword(),
            signUp:(_)=>SignUpScreen(),
            profileSetup:(_)=>ProfileSetupScreen(),
            bottomNavigationBar:(_)=>KBottomNavigationBar(),
            createTaskScreen:(_)=>CreateTaskScreen(),
            createProjectScreen:(_)=>CreateProjectScreen(),
            createTeamScreen:(_)=>CreateTeamScreen(),
            selectMemberScreen:(_)=>SelectMemberScreen(),
            profileScreen:(_)=>ProfileScreen(),

          },
        );
  }
      ),
      // onGenerateRoute:appRoute.generateRoute,
    );
  }
}
