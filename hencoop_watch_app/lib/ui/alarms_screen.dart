import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hencoop_watch_app/models/alarms.dart';
import 'package:hencoop_watch_app/services/api.dart';


class Alarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarm',
      home: Scaffold(body: AlarmsScreen()),
    );
  }
}

//değişen bir durum olmadığı için stateless widget
class AlarmsScreen extends StatelessWidget {
  final api = new APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Alarm>>(
        future: api.fetchAlarm(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator()); //eğer veri alamıyorsa ekranın ortasında yükleniyor işareti

          return ListView(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            children: snapshot.data!.map((alr) =>
                ListTile(
                  leading: Container(
                    width: 70.0,
                    height: 60.0,
                    color: Colors.black,
                    child: Center(
                      child: Text("${alr.temperature}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11.0, color: Colors.white)),
                    ),
                  ),
                  title: Text(
                      "${alr.createDate}\nSıcaklık alarmı oluştu\nSıcaklık: ${alr.licensePlate}",
                      style: TextStyle(fontSize: 12.0, color: Colors.black)),
                  onTap: (){
                    //Eğer bir fonksiyon eklenecekse buraya eklenmeli.
                  },
                  contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                ),
            ).toList(),
          );
        },
      ),
    );
  }
}

