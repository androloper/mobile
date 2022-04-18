import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class MarketScreen extends KFDrawerContent {
  MarketScreen({Key? key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //     child: Container(
    //
    //     ),
    //   );
    // }
    return Scaffold(
      body: Container(

      ),
    );
  }
}
