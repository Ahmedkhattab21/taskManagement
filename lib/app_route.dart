import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtasks/presentation/screens/CreateProjectScreen.dart';
import 'package:wtasks/presentation/screens/CreateTaskScreen.dart';
import 'package:wtasks/presentation/screens/CreateTeamScreen.dart';
import 'package:wtasks/presentation/screens/EditProfileScreen.dart';
import 'package:wtasks/presentation/screens/LogInPassword.dart';
import 'package:wtasks/presentation/screens/OnBoardingScreen.dart';
import 'package:wtasks/presentation/screens/ProfileScreen.dart';
import 'package:wtasks/presentation/screens/SelectMemberScreen.dart';
import 'package:wtasks/presentation/screens/TaskDetailsScreen.dart';
import 'package:wtasks/presentation/screens/loginScreen.dart';
import 'package:wtasks/presentation/screens/profileSetupScreen.dart';
import 'package:wtasks/presentation/screens/signUpScreen.dart';
import 'package:wtasks/presentation/widgets/KBottomNavigationBar.dart';

import 'buisiness_logic/cuibits/AuthCubit.dart';
import 'buisiness_logic/cuibits/BottomNavigationBarCubit.dart';
import 'buisiness_logic/cuibits/OnBordringCubit.dart';
import 'buisiness_logic/cuibits/TaskDetailsCubit.dart';
import 'constant/string.dart';
import 'presentation/screens/SplashScreen.dart';
class AppRoute{
  Route? generateRoute(RouteSettings setting){
    switch(setting.name){
      case splashScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=>const SplashScreen());
      case onBoardingScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=>BlocProvider(
          create: (BuildContext context)=>OnBordringCubit(),
          child: OnBoardingScreen(),
        ),
        );
      case logInEmail:
        return MaterialPageRoute(builder:(BuildContext ctx)=> BlocProvider(
            create: (BuildContext context)=>AuthCubit(),
            child: LogInEmail()));
      case logInPassword:
        String tx=setting.arguments.toString();
        return MaterialPageRoute(builder:(BuildContext ctx)=> BlocProvider(
            create: (BuildContext context)=>AuthCubit(),
            child: LogInPassword(text: tx,)));
      case signUp:
        return MaterialPageRoute(builder:(BuildContext ctx)=> BlocProvider(
            create: (BuildContext context)=>AuthCubit(),
            child: SignUpScreen()));
      case profileSetup:
        return MaterialPageRoute(builder:(BuildContext ctx)=> BlocProvider(
            create: (BuildContext context)=>AuthCubit(),
            child:const ProfileSetupScreen()));
      case bottomNavigationBar:
        return MaterialPageRoute(builder:(BuildContext ctx)=>BlocProvider(
            create:(BuildContext context)=>BottomNavigationBarCubit() ,
            child: const KBottomNavigationBar()));
      case taskDetailsScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=> BlocProvider(
            create:(BuildContext context)=>TaskDetailsCubit() ,
            child: TaskDetailsScreen()));
      case createTaskScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=>const CreateTaskScreen());
      case createProjectScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=>const CreateProjectScreen());
      case createTeamScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=> CreateTeamScreen());
      case selectMemberScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=> SelectMemberScreen());
      case profileScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=> ProfileScreen());
      case editProfileScreen:
        return MaterialPageRoute(builder:(BuildContext ctx)=> EditProfileScreen());
    }
  }
}
