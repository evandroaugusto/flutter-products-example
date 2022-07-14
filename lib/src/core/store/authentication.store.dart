import 'package:app_referencia/src/core/store/authentication.state.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthenticationStore extends StateNotifier<AuthenticationState> {
  AuthenticationStore() : super(AuthenticationState.initialState);

  AuthMode get authMode => state.authMode;

  void login() {
    state = AuthenticationState(authMode: AuthMode.loggedIn);
  }

  void logout() {
    state = AuthenticationState(authMode: AuthMode.loggedOut);
  }
}
