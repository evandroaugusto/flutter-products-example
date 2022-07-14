import 'package:app_referencia/src/core/services/dio_client.dart';
import 'package:app_referencia/src/features/users/domain/entity/user.dart';
import 'package:app_referencia/src/features/users/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';

class UsersAPI implements UserRepository {
  late final dio = DioClient().instance;

  Future<List<User>> fetchUsers() async {
    Response response = await dio.get('/users');

    var users = (response.data as List).map((item) {
      return User.fromMap(item);
    }).toList();

    return users;
  }

  Future<User> fetchUser(int userId) async {
    Response response = await dio.get('/users/$userId');

    return User.fromMap(response.data);
  }
}
