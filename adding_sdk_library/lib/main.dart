import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await registerForNotification('dadsasdasdasdasdasdasdasdasd');
  //debugPrint(a.toString());
  runApp(const MyApp());
}

final MethodChannel _twilioChannel = MethodChannel('twilio_chat_conversation/onNotificationSubscribed');


Future<void> registerForNotification(String token) async {
  final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
      'dev.flutter.pigeon.ConversationClientApi.registerForNotification', StandardMessageCodec());
  final Map<Object?, Object?>? replyMap = await channel.send(token) as Map<Object?, Object?>?;
  if (replyMap == null) {
  debugPrint('buraya düştü');
  } else if (replyMap['error'] != null) {
    final Map<Object?, Object?> error =
    (replyMap['error'] as Map<Object?, Object?>?)!;
    throw PlatformException(
      code: (error['code'] as String?)!,
      message: error['message'] as String?,
      details: error['details'],
    );
  } else {
    return;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Placeholder(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
