import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class SixthPage extends KFDrawerContent {
  SixthPage({Key? key});

  @override
  _SixthPageState createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigoAccent
    );
  }
}
