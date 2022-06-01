import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getAppVersion();
  runApp(const MyApp());
}

getAppVersion() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    // String appName = packageInfo.appName;
    // prefs.setString('appName', appName);
    // String packageName = packageInfo.packageName;
    // prefs.setString('packageName', packageName);
    String version = packageInfo.version;
    prefs.setString('version', version);
    // String buildNumber = packageInfo.buildNumber;
    // prefs.setString('buildNumber', buildNumber);
    // print('$appName\n$packageName\n$version\n$buildNumber');
  });
}

checkAppVersion() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final appVersions = await Service().fetchVersions();
  debugPrint('The Last Version of the App: ${appVersions.appVersion3}');
  var version = prefs.getString('version');
  debugPrint('The Version of the App: $version');
  bool hasUpdate = false;
  if(appVersions.appVersion3!=version){
    hasUpdate = true;
  }
  debugPrint('There is an update: ${hasUpdate.toString()}');
  MyHomePage.upToDate = hasUpdate;
  return hasUpdate;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontends Union',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'IG @FrontendsUnion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static bool? upToDate;
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late FToast fToast;

  @override
  initState() {
    fToast = FToast();
    fToast.init(context);
    checkAppVersion().then((value) => {
      MyHomePage.upToDate = value,
      if(MyHomePage.upToDate==true) {
        fToast.showToast(
          toastDuration: const Duration(seconds: 5),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * .8,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //androloper -> github.com/androloper -> ramazanbayborek.com
              shape: BoxShape.rectangle,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "New version is live!\nPlease, update your app from app markets (AppStore or PlayStore).",
                      maxLines: 4,
                      softWrap: false,
                      style: TextStyle(
                          color: CupertinoColors.white, fontSize: 16.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          gravity: ToastGravity.CENTER,
        ),
    }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        foregroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The Version Control App',
            ),
          ],
        ),
      ),
    );
  }
}
