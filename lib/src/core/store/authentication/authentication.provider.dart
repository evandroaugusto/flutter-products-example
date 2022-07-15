import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'authentication.state.dart';
import 'authentication.store.dart';

var authenticationStoreProvider =
    StateNotifierProvider<AuthenticationStore, AuthenticationState>(
  create: (_) => AuthenticationStore(),
);
