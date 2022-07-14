import 'package:app_referencia/src/app.routes.dart';
import 'package:app_referencia/src/features/users/domain/entity/user.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final User? user;
  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToUserDetail(int userId) {
      Navigator.of(context).pushNamed(
        AppRoutes.userDetail,
        arguments: userId,
      );
    }

    return Card(
      elevation: 1.5,
      child: ListTile(
        leading: const Icon(Icons.account_circle, size: 28),
        title: Text(user!.name.fullname),
        onTap: () => _navigateToUserDetail(user!.id),
      ),
    );
  }
}
