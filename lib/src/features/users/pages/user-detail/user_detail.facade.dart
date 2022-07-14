import 'package:app_referencia/src/features/users/domain/entity/user.dart';
import 'package:app_referencia/src/features/users/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserDetailFacade extends ChangeNotifier {
  UserRepository repository;

  UserDetailFacade({required this.repository});

  Future<User> fetchUser(int userId) async {
    return await repository.fetchUser(userId);
  }
}
