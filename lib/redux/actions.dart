import '../Model/user_model.dart';

class UserLoginAction {
  final UserModel user;
  UserLoginAction(this.user);
}

class UserLogoutAction {
  UserLogoutAction();
}

class SetForgotPasswordEmailAction {
  final String email;
  SetForgotPasswordEmailAction(this.email);
}

class UnsetForgotPasswordEmailAction {
  UnsetForgotPasswordEmailAction();
}
