import 'package:provider/single_child_widget.dart';

import '../../features/products/providers.dart';
import '../../features/users/providers.dart';

class SettingsProviders {
  SettingsProviders._();

  static final List<SingleChildStatelessWidget> providers = [
    productsStoreProvider,
    usersStoreProviders
  ];
}
