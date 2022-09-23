import 'package:blog_app/helpers/launcher.dart';
import 'package:blog_app/providers/medium_article_notifier.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'package:blog_app/routes/router.dart';
import 'package:blog_app/services/auth_service.dart';
import 'package:blog_app/services/shared_preference_service.dart';
import 'package:blog_app/views/home.dart';
import 'package:blog_app/views/intro_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'helpers/theme.dart';

final Launcher launcher = Launcher();

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final String license =
        await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesService().init();
  await MobileAds.instance.initialize();
  runApp(
    MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
        ChangeNotifierProvider<MediumArticleNotifier>(
            create: (_) => MediumArticleNotifier()),
      ],
      child: BlogApp(),
    ),
  );
}

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  AuthService _authService = AuthService();
  late Widget homeWidget;
  late bool signedIn;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    checkFirstSeen();
    signInAnonymously();
  }

  void getCurrentAppTheme() {
    themeChangeProvider.darkTheme = SharedPreferencesService.getDarkTheme();
  }

  void checkFirstSeen() {
    final bool _firstLaunch = SharedPreferencesService.getFirstLaunch();

    if (_firstLaunch) {
      homeWidget = const IntroScreen();
    } else {
      homeWidget = HomePage();
    }
    SharedPreferencesService.setFirstLaunch(to: false);
    setState(() {});
  }

  void signInAnonymously() async {
    signedIn = await _authService.signInAnonymously();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder:
            (BuildContext context, DarkThemeProvider value, Widget? child) {
          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                builder: (_, Widget? child) =>
                    ScrollConfiguration(behavior: MyBehavior(), child: child!),
                theme: themeChangeProvider.darkTheme ? darkTheme : lightTheme,
                home: homeWidget,
                onGenerateRoute: RoutePage.generateRoute),
          );
        },
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
