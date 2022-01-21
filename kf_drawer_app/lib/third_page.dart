import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class ThirdPage extends KFDrawerContent {
  ThirdPage({Key? key});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellowAccent
    );
  }
}
