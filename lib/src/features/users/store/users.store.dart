import 'package:state_notifier/state_notifier.dart';

import '../domain/entity/user.dart';
import '../repositories/user_repository.dart';
import 'users.state.dart';

class UsersStore extends StateNotifier<UsersState> {
  UserRepository repository = UserRepository();
  UsersStore({required this.repository}) : super(UsersState.initialState);

  List<User> get users => state.users;

  Future<List<User>> fetchUsers() async {
    var users = await repository.fetchUsers();
    state = state.copyWith(users: users, isLoading: false);
    return users;
  }
}
