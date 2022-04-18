import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:notmerkezi/account/ui/account_screen.dart';
import 'package:notmerkezi/market/ui/market_screen.dart';
import 'package:notmerkezi/notes/ui/notes_screen.dart';
import 'package:notmerkezi/settings/settings_screen.dart';
import 'package:notmerkezi/settings/support_screen.dart';
import '../../../account/ui/login_screen.dart';
import '../../../home_screen.dart';
import 'class_builder.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;
  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('HomeScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Ana Sayfa',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          icon: Icon(Icons.home, color: Colors.indigo),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Not Marketi',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          icon: Icon(Icons.business, color: Colors.indigo),
          page: MarketScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Notlarım',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          icon: Icon(Icons.business, color: Colors.indigo),
          page: NotesScreen(),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Text('Hesabım',
        //       style: TextStyle(
        //           color: Colors.indigo,
        //           fontSize: 16,
        //           fontWeight: FontWeight.w400)),
        //   icon: Icon(Icons.business, color: Colors.indigo),
        //   page: AccountScreen(account: null,),
        // ),
        KFDrawerItem.initWithPage(
          text: Text('Ayarlar',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          icon: Icon(Icons.business, color: Colors.indigo),
          page: SettingsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Destek',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          icon: Icon(Icons.business, color: Colors.indigo),
          page: SupportScreen(),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
        menuPadding: EdgeInsets.only(top:20.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: width*.55,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0, top:50),
                  child: Image.asset(
                    'assets/nobg-logo.png',
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        footer: Column(
          children: [
            KFDrawerItem(
                icon: Icon(Icons.logout, color: Colors.indigo,),
                text: Text(
                  'Çıkış Yap',
                  style: TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onPressed: () async {
                  // await api.logout(LoginApi.userId);
                  Navigator.pushReplacement(context, CupertinoPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                }
            ),
            KFDrawerItem(
              icon: Icon(Icons.person, color: Colors.indigo,),
              text: Text(
                // 'Sayın ${LoginApi.userInfo.userName!.toUpperCase()}',
                'Sayın',
                style: TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Colors.amberAccent, Colors.indigoAccent],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}