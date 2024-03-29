import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wtasks/presentation/screens/CreateProjectScreen.dart';
import 'package:wtasks/presentation/screens/CreateTeamScreen.dart';
import 'package:wtasks/presentation/screens/LogInPassword.dart';
import 'package:wtasks/presentation/screens/OnBoardingScreen.dart';
import 'package:wtasks/presentation/screens/ProfileScreen.dart';
import 'package:wtasks/presentation/screens/SelectMemberScreen.dart';
import 'package:wtasks/presentation/screens/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtasks/presentation/screens/loginScreen.dart';
import 'package:wtasks/presentation/screens/signUpScreen.dart';
import 'package:wtasks/presentation/screens/profileSetupScreen.dart';
import 'package:wtasks/presentation/widgets/KBottomNavigationBar.dart';

import 'buisiness_logic/bloc_observer.dart';
import 'buisiness_logic/cuibits/AuthCubit.dart';
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

  final pref = await SharedPreferences.getInstance();
  String? tok =pref.getString("token")??null;

  runApp( TaskManagement( repository : Repository(WebServices()),token: tok,));
}

class TaskManagement extends StatelessWidget {
  String? token;
  Repository repository;
  TaskManagement({required this.repository,this.token});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        token == null ?
        BlocProvider<AuthCubit>(
          create: (BuildContext context) {
            return AuthCubit(repository);
          },
        ):
        BlocProvider<AuthCubit>(
          create: (BuildContext context) {
            return AuthCubit(repository)..currentIndexEqualZero()..loggedByGoogle();
          },
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
            home: token==null?
            const SplashScreen():const KBottomNavigationBar(),
          routes: {
            onBoardingScreen:(_)=>OnBoardingScreen(),
            logInEmail:(_)=>LogInEmail(),
            logInPassword:(_)=>LogInPassword(),
            signUp:(_)=>SignUpScreen(),
            profileSetup:(_)=>ProfileSetupScreen(),
            bottomNavigationBar:(_)=>KBottomNavigationBar(),
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
