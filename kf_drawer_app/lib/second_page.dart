import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class SecondPage extends KFDrawerContent {
  SecondPage({Key? key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent
    );
  }
}
