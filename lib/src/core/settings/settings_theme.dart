import 'package:flutter/material.dart';

class SettingsThemeApp {
  BuildContext context;
  SettingsThemeApp(this.context);

  TextTheme get _textTheme => Theme.of(context).textTheme.apply(
        displayColor: Colors.white,
        bodyColor: Colors.white,
      );

  ThemeData get theme => ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        textTheme: _textTheme.copyWith(
          bodyText2: _textTheme.bodyText2!.copyWith(fontSize: 13, height: 1.4),
        ),
      );
}
