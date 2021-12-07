import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_project/view-model/media_view_model.dart';
import 'package:simple_mvvm_project/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MediaViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Media Player',
        theme: ThemeData(
          appBarTheme: AppBarTheme(),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}