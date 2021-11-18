import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hencoop_watch_app/models/configs.dart';
import 'package:hencoop_watch_app/services/api.dart';
import 'package:hencoop_watch_app/ui/settings_screen.dart';

class Configs extends StatefulWidget {

  //Buraya başka sayfadan veri aktarımı gerçekleştirilecekse kullanılacak sınıfa yönelik değişken oluşturulmalı,
  //bu sayede widget kullanımı ile diğer sayfadaki değişkenlere erişilmektedir.
  Config cfg;
  Configs({required this.cfg});

  @override
  State<StatefulWidget> createState() => ConfigsScreen();
}

class ConfigsScreen extends State<Configs> {
  final api = new APIService();
  var temperatureLowerLimitController = TextEditingController();
  var temperatureUpperLimitController = TextEditingController();
  var humidityLowerLimitController = TextEditingController();
  var humidityUpperLimitController = TextEditingController();
  final messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: messangerKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 30.0),
                        child:
                        Text("${widget.cfg.licensePlate} Alarm Düzenleme",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("Sıcaklık Alarmı",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Sıcaklık Alt Limit",
                          style: TextStyle(fontSize: 14),
                        )),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 40,
                      padding: EdgeInsets.only(top: 5.0),
                      child: TextField(
                        scrollPadding: EdgeInsets.all(5.0),
                        controller: temperatureLowerLimitController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "${widget.cfg.alarms![0].lowerLimit}",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Sıcaklık Üst Limit",
                          style: TextStyle(fontSize: 14),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      alignment: Alignment.center,
                      height: 40,
                      child: TextField(
                        controller: temperatureUpperLimitController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "${widget.cfg.alarms![0].upperLimit}",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text("Nem Alarmı",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Nem Alt Limit",
                          style: TextStyle(fontSize: 14),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      alignment: Alignment.center,
                      height: 40,
                      child: TextField(
                        controller: humidityLowerLimitController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "${widget.cfg.alarms![1].lowerLimit}",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Nem Üst Limit",
                          style: TextStyle(fontSize: 14),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      alignment: Alignment.center,
                      height: 40,
                      child: TextField(
                        controller: humidityUpperLimitController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "${widget.cfg.alarms![1].upperLimit}",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Kaydet',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 15.0),
                        alignment: Alignment.topCenter,
                      ),
                      onPressed: () {
                        setState((){
                          //önce atama sonra güncelleme
                          widget.cfg.alarms![0].lowerLimit = int.parse(temperatureLowerLimitController.text);
                          widget.cfg.alarms![0].upperLimit = int.parse(temperatureUpperLimitController.text);
                          widget.cfg.alarms![1].lowerLimit = int.parse(humidityLowerLimitController.text);
                          widget.cfg.alarms![1].upperLimit = int.parse(humidityUpperLimitController.text);
                          api.updateConfig(Config(deviceId: widget.cfg.deviceId, alarms:widget.cfg.alarms));
                          messangerKey.currentState!.showSnackBar(
                              SnackBar(content: Text('Değerler güncellenmiştir.')));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                          api.fetchConfig();
                          if(widget.cfg.deviceId==null || temperatureLowerLimitController.text==null || temperatureUpperLimitController.text==null
                              || humidityLowerLimitController.text == null || humidityUpperLimitController.text==null)
                            throw new Exception('Hatalı çağırma');
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Text('Geri Dön',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 15.0),
                        alignment: Alignment.topCenter,
                      ),
                      onPressed: () {
                        Navigator.pop(context); //var olan sayfadan geri dönmek için gereken kodlama
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}
