//http://77.223.141.212/kumescellws2/TrackingService.svc/LastValuesByUser?UserName=cpafyon&Password=cp0469
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hencoop_watch_app/services/api.dart';
import 'package:hencoop_watch_app/models/sensors.dart';

class Sensors extends StatefulWidget {
  Sensor cens;
  Sensors({required this.cens});

  @override
  State<StatefulWidget> createState() => SensorsScreen();
}

class SensorsScreen extends State<Sensors> {
  final api = new APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Sensor>>(
        future: api.fetchCensor(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            children: snapshot.data!.map((cen) {
              if (widget.cens.licensePlate == cen.licensePlate)
                return ListTile(
                  leading: Container(
                    width: 90.0,
                    height: 80.0,
                    color: Colors.black,
                    child: Center(
                      child: Text("${cen.isOnline ? "açık" : "kapalı"}\n${widget.cens.lastDate}\n${widget.cens.lastTime}",
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 11.0, color: Colors.white)),
                    ),
                  ),
                  title: Text("${cen.licensePlate} - ${cen.sensorName!.toUpperCase()}\nSıcaklık: ${cen.temperature}°C\nNem: %${cen.humidity}",
                      style: TextStyle(fontSize: 12.0, color: Colors.black)),
                  contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                );
              return SizedBox.shrink(); //Önceki sayfada yer alan verilerde kullanılmayanları göstermemeyi sağlayan koddur.
            }).toList(),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        child: Text(
          "Geri Dön",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
