import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectivityScreen(),
    );
  }
}

class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({super.key});

  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  final List<String> _connectionLogs = [];
  ConnectivityResult? _lastResult;

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      final timestamp = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
      if (_lastResult != result[0]) {
        if(result.contains(ConnectivityResult.wifi)||result.contains(ConnectivityResult.mobile)){
          _connectionLogs.add('Connection has provided at $timestamp');
        }
        else {
          _connectionLogs.add('Connection has lost at $timestamp');
        }
        _lastResult = result[0];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (BuildContext context, AsyncSnapshot<List<ConnectivityResult>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
          return AScreen(connectionLogs: _connectionLogs);
        } else {
          if (snapshot.hasData) {
            final connectivityResult = snapshot.data;
            if (connectivityResult!.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
              return BScreen(connectionLogs: _connectionLogs);
            } else {
              return AScreen(connectionLogs: _connectionLogs);
            }
          } else {
            return AScreen(connectionLogs: _connectionLogs);
          }
        }
      },
    );
  }
}

class AScreen extends StatelessWidget {
  final List<String> connectionLogs;

  const AScreen({super.key, required this.connectionLogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView.builder(
        itemCount: connectionLogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(connectionLogs[index]),
          );
        },
      ),
    );
  }
}

class BScreen extends StatelessWidget {
  final List<String> connectionLogs;

  const BScreen({super.key, required this.connectionLogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView.builder(
        itemCount: connectionLogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(connectionLogs[index]),
          );
        },
      ),
    );
  }
}

class CScreen extends StatelessWidget {
  final List<String> connectionLogs;

  const CScreen({super.key, required this.connectionLogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView.builder(
        itemCount: connectionLogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(connectionLogs[index]),
          );
        },
      ),
    );
  }
}