import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.routes.dart';
import 'core/settings/settings_providers.dart';
import 'core/store/authentication/authentication.state.dart';
import 'core/store/authentication/authentication.store.dart';
import 'features/authentication/pages/login.page.dart';
import 'features/dashboard/pages/dashboard.page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppReferencia extends StatelessWidget {
  const AppReferencia({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = SettingsThemeApp(context).theme;

    return MultiProvider(
      providers: SettingsProviders.providers,
      child: MaterialApp(
        title: 'App Referencia',
        routes: AppRoutes().routes,
        navigatorKey: navigatorKey,
        //theme: SettingsThemeData,
        home: Consumer<AuthenticationStore>(
          builder: (context, store, child) {
            var state = context.watch<AuthenticationState>();

            return state.authMode == AuthMode.loggedOut
                ? const LoginPage()
                : const DashboardPage();
          },
        ),
      ),
    );
  }
}
