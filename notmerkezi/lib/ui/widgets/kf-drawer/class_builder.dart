import 'package:notmerkezi/account/ui/account_screen.dart';
import 'package:notmerkezi/market/ui/market_screen.dart';
import 'package:notmerkezi/notes/ui/notes_screen.dart';
import 'package:notmerkezi/settings/settings_screen.dart';
import 'package:notmerkezi/settings/support_screen.dart';

import '../../../home_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<MarketScreen>(() => MarketScreen());
    register<NotesScreen>(() => NotesScreen());
    // register<AccountScreen>(() => AccountScreen(account: account));
    register<SettingsScreen>(() => SettingsScreen());
    register<SupportScreen>(() => SupportScreen());

  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}