import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  debugPrint('Incoming notification ${message.notification!.body}');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      debugPrint(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      debugPrint("Received message");
      debugPrint(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('Message clicked');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }

}
