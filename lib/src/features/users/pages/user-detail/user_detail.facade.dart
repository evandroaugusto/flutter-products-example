import 'package:flutter/material.dart';

import '../../domain/entity/user.dart';
import '../../repositories/user_repository.dart';

class UserDetailFacade extends ChangeNotifier {
  UserRepository repository;

  UserDetailFacade({required this.repository});

  Future<User> fetchUser(int userId) async {
    return await repository.fetchUser(userId);
  }
}
