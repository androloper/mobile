import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'İletişim',
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
                color: Colors.white, onPressed: () => Navigator.of(context).pop()
            ),
            title: Text(
              "İletişim",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          body: ContactScreen()),
    );
  }
}
class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ContactScreen(context);
  }
}
Widget _ContactScreen(BuildContext context) {
  return Center(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "İletişim Bilgileri\n",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Türkiye Genel Distribütörü\n",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Küçük Sanayi Sitesi\n1312 Sokak No:42\nBandırma Balıkesir\nTel: 0266 721 37 70\nFax: 0266 721 37 72\nMail: info@kumescell.com.tr\n",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            Text(
              "Çağrı Merkezi: 444 3 721\n",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "2014 © Copyright Kumescell",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}