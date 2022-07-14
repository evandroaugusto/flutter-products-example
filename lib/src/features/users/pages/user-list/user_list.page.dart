import 'package:app_referencia/src/features/users/pages/user-list/user_list_item.widget.dart';
import 'package:app_referencia/src/features/users/store/users.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<UsersStore>();

    return Scaffold(
      appBar: AppBar(title: const Text('Usuários')),
      body: FutureBuilder(
        future: store.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const _UserListPageView();
          }
        },
      ),
    );
  }
}

class _UserListPageView extends StatelessWidget {
  const _UserListPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<UsersStore>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: store.users.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(2.0),
              child: UserListItem(user: store.users[index]));
        },
      ),
    );
  }
}
