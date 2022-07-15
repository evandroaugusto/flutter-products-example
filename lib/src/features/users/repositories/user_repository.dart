import 'package:dio/dio.dart';

import '../../../core/services/dio_client.dart';
import '../domain/entity/user.dart';

class UserRepository {
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
