import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class FifthPage extends KFDrawerContent {
  FifthPage({Key? key});

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent
    );
  }
}
