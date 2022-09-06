import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../core/store/authentication/authentication.state.dart';
import 'repositories/user_repository.dart';
import 'store/users.state.dart';
import 'store/users.store.dart';

var usersStoreProviders = [
  StateNotifierProvider<UsersStore, UsersState>(
    create: (_) => UsersStore(
      repository: UserRepository(),
    ),
  ),
  ProxyProvider<AuthenticationState, UsersStore>(
    update: (BuildContext context, authState, prev) {
      var userStore = context.read<UsersStore>();

      if (!authState.isLogged) {
        userStore.clear();
      }
      return userStore;
    },
  )
];
