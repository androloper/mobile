import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_app/api.dart';

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
  static late String deviceToken;
    @override
    void initState() {
      super.initState();
      if(Platform.isAndroid){
        Firebase.initializeApp();
      }
      final messaging = FirebaseMessaging.instance;
      messaging.requestPermission(
          sound: true, alert: true, badge: true, criticalAlert: true);
      messaging.getToken().then((value) async {
        deviceToken = value!;
        debugPrint('token: ' + deviceToken);
      });
      FirebaseMessaging.onBackgroundMessage(_messageHandler);
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        debugPrint("Bildirim geldi!");
        if (Platform.isIOS) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text("Bildirim"),
              content: Text("Bildirim geldi"),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    "Tamam",
                    style: TextStyle(color: CupertinoColors.systemRed),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
        if (Platform.isAndroid) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Bildirim"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [Text("Bildirim geldi")],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Tamam'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }
        debugPrint(event.notification!.body);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((message) {});
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final response = await Api().loginComplete(1, deviceToken);
              debugPrint(response.toString());
            },
            child: Text('Push Notification App')),
      ),
    );
  }
}
