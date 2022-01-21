import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class SeventhPage extends KFDrawerContent {
  SeventhPage({Key? key});

  @override
  _SeventhPageState createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurpleAccent
    );
  }
}
