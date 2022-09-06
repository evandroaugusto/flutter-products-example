import 'package:app_referencia/src/core/store/authentication/authentication.state.dart';
import 'package:app_referencia/src/features/users/repositories/user_repository.dart';
import 'package:app_referencia/src/features/users/store/users.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/products/providers.dart';
import '../../features/users/providers.dart';

import '../../features/users/store/users.store.dart';
import '../store/authentication/authentication.provider.dart';

extension Typing<T> on List<T> {
  Type get genericType => T;
}

class SettingsProviders {
  SettingsProviders._();

  static final providers = [
    authenticationStoreProvider,
    productsStoreProvider,
    ...usersStoreProviders,
  ];
}
