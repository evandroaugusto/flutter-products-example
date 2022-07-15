import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/user.dart';
import '../../repositories/user_repository.dart';
import 'user_detail.facade.dart';
import 'user_info.widget.dart';

class UserDetaiPage extends StatelessWidget {
  const UserDetaiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        appBar: AppBar(title: const Text('Detalhes usuário')),
        body: ChangeNotifierProvider<UserDetailFacade>(
          create: (_) => UserDetailFacade(repository: UserRepository()),
          builder: (context, child) {
            var facade = context.read<UserDetailFacade>();

            return FutureBuilder(
              future: facade.fetchUser(userId),
              builder: (context, AsyncSnapshot<User> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _UserPageDetailView(user: snapshot.data);
                }
              },
            );
          },
        ));
  }
}

class _UserPageDetailView extends StatelessWidget {
  final User? user;

  const _UserPageDetailView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          Text(
            user!.name.fullname,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          UserInfo(label: 'Email:', value: user!.email),
          UserInfo(label: 'Usuário:', value: user!.username),
          UserInfo(label: 'Cidade:', value: user!.address.city),
          UserInfo(label: 'Rua:', value: user!.address.street),
          UserInfo(label: 'CEP:', value: user!.address.zipcode),
        ],
      ),
    );
  }
}
