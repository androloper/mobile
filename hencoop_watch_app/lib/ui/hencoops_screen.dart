import 'package:flutter/material.dart';
import 'package:hencoop_watch_app/models/hencoops.dart';
import 'package:hencoop_watch_app/models/sensors.dart';
import 'package:hencoop_watch_app/services/api.dart';
import 'package:hencoop_watch_app/ui/sensors_screen.dart';

class Hencoops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kümes',
      home: Scaffold(body: HencoopScreen()),
    );
  }
}

class HencoopScreen extends StatelessWidget {
  final api = new APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Hencoop>>(
        future: api.fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            children: snapshot.data!.map((henc) => ListTile(
              leading: Container(
                width: 90.0,
                height: 80.0,
                color: Colors.black,
                child: Center(
                  child: Text(
                      "${henc.isOnline ? "açık" : "kapalı"}\n${henc.lastDate}\n${henc.lastTime}\n${henc.reasonStr}",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 10.0, color: Colors.white)),
                ),
              ),
              title: Text(
                  "${henc.licensePlate} (${henc.sensorCount} sensör)\nElektrik ${henc.powerStatus ? "var" : "yok"}\nSıcaklık: ${henc.temperature}°C\nNem: %${henc.humidity}",
                  style: TextStyle(fontSize: 11.0, color: Colors.black)),
              onTap: () {
                var cens = Sensor(
                    licensePlate: "${henc.licensePlate}",
                    lastDate: "${henc.lastDate}",
                    lastTime: "${henc.lastTime}");
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sensors(cens: cens)));
              },
              contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
            ),
            )
                .toList(),
          );
        },
      ),
    );
  }
}
