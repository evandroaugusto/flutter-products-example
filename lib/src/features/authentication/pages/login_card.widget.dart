import 'package:app_referencia/src/core/store/authentication.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

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
