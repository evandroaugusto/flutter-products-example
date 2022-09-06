enum AuthMode { loggedIn, loggedOut }

class AuthenticationState {
  AuthMode authMode;

  static AuthenticationState get initialState =>
      AuthenticationState(authMode: AuthMode.loggedOut);

  AuthenticationState({
    required this.authMode,
  });

  bool get isLogged => authMode == AuthMode.loggedIn;
}
