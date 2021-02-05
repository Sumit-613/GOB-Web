import '../Model/user_model.dart';

class AppState {
  UserModel _user;
  String _forgotPasswordEmail;

  AppState() {
    this._user = new UserModel();
  }
  AppState.init(this._user, this._forgotPasswordEmail);

  Map<String, dynamic> toJson() => {
        '_user': this._user.toJson(),
        '_forgotPasswordPhNo': this._forgotPasswordEmail
      };

  static AppState fromJson(dynamic json) {
    return json != null
        ? AppState.init(
            UserModel.fromJson(json['_user']), json['_forgotPasswordPhNo'])
        : null;
  }

  void setUser(UserModel newUser) {
    this._user = newUser;
  }

  void unsetUser() {
    this._user = null;
  }

  UserModel getUser() {
    return this._user;
  }

  String name() {
    return this._user.fullName;
  }

  String phNo() {
    return this._user.phNo;
  }

  String email() {
    return this._user.email;
  }

  String gender() {
    return this._user.gender;
  }

  String age() {
    return this._user.age;
  }

  void setForgotPasswordEmail(String email) {
    this._forgotPasswordEmail = email;
  }

  void unsetForgotPasswordEmail() {
    this._forgotPasswordEmail = null;
  }

  String forgotPasswordEmail() {
    return this._forgotPasswordEmail;
  }
}
