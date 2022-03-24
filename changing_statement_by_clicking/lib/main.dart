import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
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
  DateTime? loginClickTime;

  bool isRedundentClick(DateTime currentTime){
    if(loginClickTime==null){
      loginClickTime = currentTime;
      debugPrint("first click");
      return false;
    }
    debugPrint('diff is ${currentTime.difference(loginClickTime!).inSeconds}');
    if(currentTime.difference(loginClickTime!).inSeconds<10){//set this difference time in seconds
      return true;
    }

    loginClickTime = currentTime;
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () => {
            if(isRedundentClick(DateTime.now())){
              debugPrint('hold on, processing'),
              Fluttertoast.showToast(
                  msg: "Lütfen işleminiz tamamlanana kadar bekleyiniz",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.amber,
                  textColor: Colors.white,
                  fontSize: 16.0),
            },
            debugPrint('run process'),
            Fluttertoast.showToast(
                msg: "İşleminiz tamamlanmıştır.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0),
          },
        )
      ),
    );
  }
}
