import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ringtone Player'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Play Alarm'),
                    onPressed: () {
                      FlutterRingtonePlayer.playAlarm();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Play Alarm asAlarm: false'),
                    onPressed: () {
                      FlutterRingtonePlayer.playAlarm(asAlarm: false);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Play Notification'),
                    onPressed: () {
                      FlutterRingtonePlayer.playNotification();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Play Ringtone'),
                    onPressed: () {
                      FlutterRingtonePlayer.playRingtone();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Customizable Sound'),
                    onPressed: () {
                      FlutterRingtonePlayer.play(
                        android: AndroidSounds.alarm,
                        // android: AndroidSounds.notification,
                        // android: AndroidSounds.ringtone,
                        ios: IosSounds.glass,
                        // ios: IosSounds.alarm,
                        // ios: IosSounds.bell,
                        // ios: IosSounds.electronic,
                        looping: true,
                        volume: 1.0,
                        asAlarm: false
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text('Stop'),
                    onPressed: () {
                      FlutterRingtonePlayer.stop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}