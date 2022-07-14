import 'package:app_referencia/src/features/users/store/users.state.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:app_referencia/src/features/users/api/users_api.dart';
import 'package:app_referencia/src/features/users/domain/entity/user.dart';
import 'package:app_referencia/src/features/users/domain/repository/user_repository.dart';

class UsersStore extends StateNotifier<UsersState> {
  UserRepository repository = UsersAPI();
  UsersStore({required this.repository}) : super(UsersState.initialState);

  List<User> get users => state.users;

  Future<List<User>> fetchUsers() async {
    var users = await repository.fetchUsers();
    state = state.copyWith(users: users, isLoading: false);
    return users;
  }
}
