import 'package:state_notifier/state_notifier.dart';
import 'authentication.state.dart';

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
