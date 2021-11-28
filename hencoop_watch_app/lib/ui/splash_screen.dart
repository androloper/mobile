import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: SizedBox(
                height: 200.0,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          backgroundColor: Colors.blue,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Center(child: Text("Bağlantı kuruluyor...")),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}