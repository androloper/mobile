import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: Colors.blue,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Center(child: Text('Connecting...')),
                ],
              ),
            ),
          ],
        )
    );
  }
}