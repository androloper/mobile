import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class FirstPage extends KFDrawerContent {
  FirstPage({Key? key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent
    );
  }
}
