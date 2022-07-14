import 'package:app_referencia/src/features/users/domain/entity/user.dart';

class UsersState {
  List<User> users;
  bool isLoading;

  static UsersState get initialState => UsersState(
        users: [],
        isLoading: true,
      );

  UsersState({
    required this.users,
    required this.isLoading,
  });

  UsersState copyWith({
    List<User>? users,
    bool? isLoading,
  }) {
    return UsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
