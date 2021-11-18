import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hencoop_watch_app/ui/contact_screen.dart';
import 'package:hencoop_watch_app/ui/settings_screen.dart';

import 'alarms_screen.dart';
import 'hencoops_screen.dart';

class LiveWatching extends StatefulWidget {
  State<StatefulWidget> createState() => MyApp2();
}
class MyApp2 extends State<LiveWatching> {
  int currentPage = 0;
  final navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey bottomNavigationKey = GlobalKey();

  @override //refresh ikonundaki fonksiyon güncellemesi yapılacak!
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              "Canlı İzleme Sayfası",
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              //IconButton(onPressed: (), tooltip: "Veriler güncellenmiştir.", icon: Icons.refresh),

              PopupMenuButton(itemBuilder: (content) => [
                PopupMenuItem(child: Text("İletişim"), value: 1),
                PopupMenuItem(child: Text("Çıkış"), value: 2),
              ],
                onSelected: (int val) {
                  if(val == 1){
                    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => Contact()));
                  } else if (val == 2){
                    SystemNavigator.pop();
                  }
                },
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: _getPage(currentPage),
            ),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Colors.white,
            activeIconColor: Colors.grey,
            inactiveIconColor: Colors.grey,
            barBackgroundColor: Colors.blue,
            textColor: Colors.white,
            tabs: [
              TabData(
                  iconData: Icons.location_pin,
                  title: "Kümesler",
                  onclick: () {
                    final State<StatefulWidget>? fState = bottomNavigationKey.currentState;
                  }),
              TabData(
                iconData: Icons.access_alarms,
                title: "Son Alarmlar",
              ),
              TabData(
                  iconData: Icons.settings,
                  title: "Ayarlar"
              )
            ],
            initialSelection: 0,
            key: bottomNavigationKey,
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          ),
        )
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0: //kümes sayfası padding ve appbar kontrol edilmeli!
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kümesler',
          home: Scaffold(
              body: Hencoops()),
        );

      case 1:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kümes',
          home: Scaffold(
              body: Alarms()),
        );

      default: //ayarlar kaydetme kısmı düzenlenecek!
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ayarlar',
          home: Scaffold(
              body: Settings()),
        );
    }
  }
}