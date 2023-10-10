import 'package:flutter/material.dart';
import 'package:modbus_client/wSilo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Unifortunately'),
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

  TextEditingController rawMat = TextEditingController(text: 'BOŞ');
  TextEditingController siloName = TextEditingController(text: '101');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    debugPrint(width.toString());
    double height = MediaQuery.of(context).size.height;
    debugPrint(height.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
      ),
      body: Center(
        child: wSilo(height, 'assets/mob_silo.png', rawMat.text, siloName.text),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.background,
        onPressed: changeSiloName,
        tooltip: 'Increment',
        child: const Icon(Icons.change_circle_outlined, size: 40),
      ),
    );
  }
  int currentIndex=0;

  void changeSiloName() {
    List<String> rawMatLst = [
      'BUĞDAY KIRIĞI',
      'MISIROZU KUSPESI',
      'INCE KEPEK (18 - 24)',
      'KABA KEPEK (11 - 17)',
      '1.SNF.BONKALIT',
      'MISIR KEPEGI'];
    setState(() {
      setState(() {
        this.rawMat.text = rawMatLst[currentIndex];
        currentIndex = (currentIndex + 1) % rawMatLst.length;
      });
    });
  }
}
