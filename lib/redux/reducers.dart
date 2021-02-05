import '../Model/app_state.dart';

import './actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is UserLoginAction) {
    return userLogin(state, action);
  } else if (action is UserLogoutAction) {
    return userLogout(state, action);
  } else if (action is SetForgotPasswordEmailAction){
    return setForgotPasswordEmail(state, action);
  }
  return null;
}

AppState userLogin(AppState state, UserLoginAction action) {
  state.setUser(action.user);
  return state;
}

AppState userLogout(AppState state, UserLogoutAction action){
  state.unsetUser();
  return state;
}

AppState setForgotPasswordEmail(AppState state, SetForgotPasswordEmailAction action){
  state.setForgotPasswordEmail(action.email);
  return state;
}

AppState unsetForgotPasswordEmail(AppState state, UnsetForgotPasswordEmailAction action){
  state.unsetForgotPasswordEmail();
  return state;
}