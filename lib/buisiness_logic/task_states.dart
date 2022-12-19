import '../data/model/profile_model.dart' as profile;
import '../data/model/users_model.dart'as u;

import '../data/model/projects_model.dart';

abstract class TaskStates{}

class InitialState extends TaskStates{}

class OnPageChangedState extends TaskStates{}

class OnPasswordChangeState extends TaskStates{}

class OnClearAbleChangeToTrueState extends TaskStates{}
class OnClearAbleChangeToFalseState extends TaskStates{}

class OnLoadingState extends TaskStates{}
class OnLoginSuccessState extends TaskStates{}
class OnLoginErrorState extends TaskStates{
  String error;
  OnLoginErrorState(this.error);
}

class OnRegisterSuccessState extends TaskStates{}
class OnRegisterErrorState extends TaskStates{
  String error;
  OnRegisterErrorState(this.error);
}

class OnGetProjectsSuccessState extends TaskStates{
  List<ProjectData> projects;
  OnGetProjectsSuccessState(this.projects);
}
class OnEmptyProjectsState extends TaskStates{}
class OnGetProjectsErrorState extends TaskStates{
  String error;
  OnGetProjectsErrorState(this.error);
}
class OnHomeLoadingState extends TaskStates{}

class OnGetProfileState extends TaskStates{
  profile.Data data;
  OnGetProfileState(this.data);
}
class OnGetProfileErrorState extends TaskStates{
  String error;
  OnGetProfileErrorState(this.error);
}
class OnEditProfileLoadingState extends TaskStates{}
class OnEditProfileSuccessState extends TaskStates{}
class OnEditProfileErrorState extends TaskStates{}

class OnGetUsersSuccessState extends TaskStates{
  List<u.User> users;
  OnGetUsersSuccessState(this.users);
}
class OnGetUsersErrorState extends TaskStates{
  String error;
  OnGetUsersErrorState(this.error);
}
class ChangeIconIndexState extends TaskStates{}
class OnGetUserLoadingState extends TaskStates{}


class OnCreateTeamSuccessState extends TaskStates{}
class OnCreateTeamErrorState extends TaskStates{}

class OnChangeDateState extends TaskStates{}


class ChangeCurrentIndexState extends TaskStates{}

class ChangeTaskState extends TaskStates{}

class LogOutState extends TaskStates{}




