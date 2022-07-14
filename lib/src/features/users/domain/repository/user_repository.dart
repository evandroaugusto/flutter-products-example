import 'package:app_referencia/src/features/users/domain/entity/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
  Future<User> fetchUser(int userId);
}
