import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class FourthPage extends KFDrawerContent {
  FourthPage({Key? key});

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent
    );
  }
}
