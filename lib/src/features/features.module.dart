import 'package:app_referencia/src/features/app.routes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/settings/settings_providers.dart';

class FeaturesModule extends StatefulWidget {
  const FeaturesModule({Key? key}) : super(key: key);

  @override
  State<FeaturesModule> createState() => _FeaturesModuleState();
}

class _FeaturesModuleState extends State<FeaturesModule> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var routes = AppRoutes().routes;

    return MultiProvider(
      providers: SettingsProviders.providers,
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: "dashboard",
          onGenerateRoute: (RouteSettings settings) {
            late WidgetBuilder builder;

            routes.forEach((key, value) {
              if (settings.name == key) {
                builder = value;
              }
            });

            return MaterialPageRoute<void>(
                builder: builder, settings: settings);
          },
        ),
      ),
    );
  }
}
