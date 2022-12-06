
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



class GetImageFromCameraState extends TaskStates{}
class GetImageFromGalaryState extends TaskStates{}

class ChangeCurrentIndexState extends TaskStates{}

class ChangeTaskState extends TaskStates{}


