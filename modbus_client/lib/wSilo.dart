import 'package:flutter/material.dart';

Widget wSilo(height, imgSrc, rawMat, siloName) => Stack(
  children: <Widget>[
    Center(
        child: Image(
          image: AssetImage(imgSrc),
        )
    ),
    Padding(
      padding: EdgeInsets.only(bottom: height*.16),
      child: Center(
        child: Transform.rotate(
          angle: 1.5708,  // Rotate by 90 degrees in radians (-π/2)
          child: Text(rawMat, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: height >= 750 ? height*.22 : height*.275),
      child: Center(
        child: Text(siloName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      ),
    ),
  ],
);