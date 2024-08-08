import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sso_example/hero.dart';
import 'package:sso_example/user.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSO App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Auth0? auth0;
  const MyHomePage({super.key, this.auth0});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserProfile? _user;
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = widget.auth0 ??
        Auth0("your_domain", "your_client_id");
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SSO Example'),
        ),
          body: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  child: Row(children: [
                    _user != null
                        ? Expanded(child: UserWidget(user: _user))
                        : const Expanded(child: HeroWidget())
                  ])),
              _user != null
                  ? ElevatedButton(
                onPressed: logout,
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text('Logout'),
              )
                  : ElevatedButton(
                onPressed: login,
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text('Login'),
              )
            ]),
          )),
    );
  }

  Future<void> login() async {
    try {
      var credentials = await auth0
          .webAuthentication(scheme: "unifortunately.development.sso_example")
          .login(useHTTPS: true);
      setState(() {
        _user = credentials.user;
      });
    } catch (e) {
      debugPrint('\n***********\n$e\n***********\n');
    }
  }

  Future<void> logout() async {
    try {
        await auth0
            .webAuthentication(scheme: "unifortunately.development.sso_example")
            .logout(useHTTPS: true);
        setState(() {
          _user = null;
        });

    } catch (e) {
      debugPrint('\n-----------------\n$e\n-----------------\n');
    }
  }
}
