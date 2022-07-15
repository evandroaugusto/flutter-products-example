import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'repositories/user_repository.dart';
import 'store/users.state.dart';
import 'store/users.store.dart';

var usersStoreProviders = StateNotifierProvider<UsersStore, UsersState>(
  create: (_) => UsersStore(
    repository: UserRepository(),
  ),
);
