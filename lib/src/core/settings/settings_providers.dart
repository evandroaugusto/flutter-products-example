import '../../features/products/providers.dart';
import '../../features/users/providers.dart';

import '../store/authentication/authentication.provider.dart';

class SettingsProviders {
  SettingsProviders._();

  static final providers = [
    authenticationStoreProvider,
    productsStoreProvider,
    usersStoreProviders
  ].toList();
}
