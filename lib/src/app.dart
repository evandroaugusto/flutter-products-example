import 'package:app_referencia/src/app.routes.dart';
import 'package:app_referencia/src/core/store/authentication/authentication.state.dart';
import 'package:app_referencia/src/core/store/authentication/authentication.store.dart';

import 'package:app_referencia/src/features/authentication/pages/login.page.dart';
import 'package:app_referencia/src/features/dashboard/pages/dashboard.page.dart';

import 'package:app_referencia/src/features/products/api/product_api.dart';
import 'package:app_referencia/src/features/products/domain/repository/product_repository.dart';
import 'package:app_referencia/src/features/products/store/products.store.dart';
import 'package:app_referencia/src/features/users/api/users_api.dart';
import 'package:app_referencia/src/features/users/domain/repository/user_repository.dart';

import 'package:app_referencia/src/features/users/store/users.state.dart';
import 'package:app_referencia/src/features/users/store/users.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

ProductRepository createProductRepository() => ProductAPI();
UserRepository createUserRepository() => UsersAPI();

class AppReferencia extends StatelessWidget {
  const AppReferencia({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = ThemeApp(context).theme;

    return MultiProvider(
      providers: [
        StateNotifierProvider<AuthenticationStore, AuthenticationState>(
          create: (_) => AuthenticationStore(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsStore(
            repository: createProductRepository(),
          ),
        ),
        StateNotifierProvider<UsersStore, UsersState>(
          create: (_) => UsersStore(
            repository: createUserRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'App Referencia',
        routes: AppRoutes().routes,
        //theme: themeData,
        home: Consumer<AuthenticationStore>(
          builder: (context, store, child) {
            context.watch<AuthenticationState>();
            return store.authMode == AuthMode.loggedOut
                ? const LoginPage()
                : const DashboardPage();
          },
        ),
      ),
    );
  }
}
