import 'dart:ffi';

import 'package:app_referencia/src/core/environments/environment.dart';
import 'package:app_referencia/src/core/settings/settings_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import 'authentication.state.dart';

class AuthenticationStore extends StateNotifier<AuthenticationState> {
  AuthenticationStore() : super(AuthenticationState.initialState);

  AuthMode get authMode => state.authMode;
  bool get isLogged => authMode == AuthMode.loggedIn;

  void login() async {
    var uuid = 'bc79d73e-55ff-473e-977d-5a96b49dbf41';
    Future.delayed(const Duration(seconds: 2));

    // serviço para setar e recuperar dados
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Environment.tokenKey, uuid);

    state = AuthenticationState(authMode: AuthMode.loggedIn);
  }

  void logout() {
    state = AuthenticationState(authMode: AuthMode.loggedOut);
  }

  void refreshToken() async {}
}
