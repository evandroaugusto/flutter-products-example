import 'package:app_referencia/src/features/users/pages/user-detail/user_detail.page.dart';
import 'package:app_referencia/src/features/users/pages/user-list/user_list.page.dart';
import 'package:app_referencia/src/features/users/users.routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers.dart';

class UsersModule extends StatefulWidget {
  const UsersModule({Key? key}) : super(key: key);

  @override
  State<UsersModule> createState() => _UsersModuleState();
}

class _UsersModuleState extends State<UsersModule> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _isExitDesired() async {
    print(':: POPUP ::');
    return await Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return SynchronousFuture(true);
      },
      child: MultiProvider(
        providers: [usersStoreProviders],
        child: Scaffold(
          appBar: appBarNav(context),
          body: Navigator(
            key: _navigatorKey,
            initialRoute: "users/lists",
            onPopPage: (route, result) {
              print("onPOPPP");
              return true;
            },
            onGenerateRoute: (settings) {
              late Widget page;

              if (settings.name == "users/lists") {
                page = const UserListPage();
              }

              if (settings.name == "/users/detail") {
                page = const UserDetaiPage();
              }

              return MaterialPageRoute<dynamic>(
                builder: (context) {
                  return page;
                },
                settings: settings,
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBarNav(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.chevron_left),
      ),
    );
  }
}
