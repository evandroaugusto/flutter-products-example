import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/store/authentication/authentication.store.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthenticationStore>(context, listen: false).logout();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthenticationStore>();

    login() {
      store.login();
    }

    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'APP TESTE',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 25),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    //style: ElevatedButton.styleFrom(primary: color ?? Colors.blue),
                    onPressed: login,
                    child: const Text('ENTRAR'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
