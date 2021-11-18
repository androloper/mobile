import 'package:flutter/material.dart';
import 'package:hencoop_watch_app/models/configs.dart';
import 'package:hencoop_watch_app/services/api.dart';

import 'configuration_screen.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayarlar',
      home: Scaffold(body: SettingsScreen()),
    );
  }
}

class SettingsScreen extends StatelessWidget {

  final api = new APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Config>>(
        future: api.fetchConfig(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            children: snapshot.data!.map((conf) =>
                ListTile(
                  leading: Container(
                    width: 90.0,
                    height: 80.0,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                          "${conf.licensePlate}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10.0, color: Colors.white)),
                    ),
                  ),
                  title: Text(
                      "Sıcaklık Alarmı Max. ${conf.alarms![0].upperLimit}\n"
                          "Sıcaklık Alarmı Min. ${conf.alarms![0].lowerLimit}\n"
                          "Nem Alarmı Max. ${conf.alarms![1].upperLimit}\n"
                          "Nem Alarmı Min. ${conf.alarms![1].lowerLimit}",
                      style: TextStyle(fontSize: 11.0, color: Colors.black)),
                  onTap: () {
                    var cfg = Config(licensePlate: conf.licensePlate, deviceId: conf.deviceId, alarms: conf.alarms);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Configs(cfg: cfg)));
                    /*
                      Sayfa geçişi yaparken geçtiğimiz sayfaya veri aktaracaksak sayfanın durumu değişeceğinden dolayı
                      geçilen sayfa stateful widget olmalıdır. Bu sayfadan aktarılacak bilgilerden en az bir(veya daha fazla)
                      değişken oluşturulmalıdır. Oluşturulan değişken geçilecek sayfada constructor olarak ayarlanmalı ve
                      burada geçiş fonksiyonuna dahil edilmelidir. Ancak ve ancak bu durumda veri aktarımı gerçekleştirilir.
                       */
                  },
                  contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                )
            ).toList(),
          );
        },
      ),
    );
  }
}
