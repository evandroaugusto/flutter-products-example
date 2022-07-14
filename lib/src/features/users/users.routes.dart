import 'package:flutter/material.dart';

import 'pages/user-detail/user_detail.page.dart';
import 'pages/user-list/user_list.page.dart';

class UserRoutes {
  static const users = '/users/lists';
  static const userDetail = '/users/detail';

  Map<String, Widget Function(BuildContext)> get routes => {
        UserRoutes.users: (ctx) => const UserListPage(),
        UserRoutes.userDetail: (ctx) => const UserDetaiPage()
      };
}
