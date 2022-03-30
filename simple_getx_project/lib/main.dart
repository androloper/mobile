import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_getx_project/app.dart';
import 'package:simple_getx_project/core/utils/index.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> initServices() async {
  ConnectivityUtil.configureConnectivityStream();

  debugPrint('Starting GetX Services...');
  await Future.wait(
    <Future<dynamic>>[
      GetStorage.init(),
      Get.putAsync(() => GlobalVariablesService().init()),
    ],
  );
  debugPrint('All GetX Services Started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(
        () async {
      await initServices();
      setPathUrlStrategy();
      runApp(
        const MovieApp(),
      );
    },
        (Object error, StackTrace stack) {
      debugPrint('ErrorAboutMovieApp: $error, $stack');
    },
  );
}