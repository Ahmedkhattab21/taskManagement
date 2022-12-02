import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtasks/presentation/screens/LogInPassword.dart';
import 'package:wtasks/presentation/screens/OnBoardingScreen.dart';
import 'package:wtasks/presentation/screens/loginScreen.dart';
import 'package:wtasks/presentation/screens/profileSetupScreen.dart';
import 'package:wtasks/presentation/screens/signUpScreen.dart';
import 'package:wtasks/presentation/widgets/KBottomNavigationBar.dart';

import 'buisiness_logic/cuibits/AuthCubit.dart';
import 'buisiness_logic/cuibits/BottomNavigationBarCubit.dart';
import 'buisiness_logic/cuibits/OnBordringCubit.dart';
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
    }
  }
}
