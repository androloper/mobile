import 'dart:async';

import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';
import 'package:knitting_models_app/screens/specific_knitting.dart';
import 'package:knitting_models_app/widgets/w_outlined_icon_text_button.dart';
import 'package:knitting_models_app/widgets/w_page_route_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KnittingModelsScreen extends StatefulWidget {
  const KnittingModelsScreen({super.key});

  @override
  State<KnittingModelsScreen> createState() => _KnittingModelsScreenState();
}

class _KnittingModelsScreenState extends State<KnittingModelsScreen> {
  var _touchPoints = [];
  late double placementY;
  late double placementX;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    var col = AppColors();
    var font = AppFonts();
    return Scaffold(
        backgroundColor: col.thirdCol,
        appBar: AppBar(
          title: Text('Örgü Motiflerim', style: font.appBarText,),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 18),
          reverse: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                child: Listener(
                  onPointerDown: (PointerDownEvent event) {
                    placementY = ((event.position.dy / height)) * 2 - 1;
                    placementX = ((event.position.dx / width)) * 2 - 1;
                    _touchPoints.add(event.position);
                    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
                      timer.cancel();
                      _touchPoints = [];
                    });
                    setState(() {});
                  },
                  child: WOutlinedIconTextButton(
                      onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await Navigator.of(context).push(WPageRouteBuilderForMenu(
                          placementX,
                          placementY,
                          SpecificKnittingScreen(row: 16, col: 9, header: 'Kalp Motifi', jsonData: prefs.getString('Kalp Motifi')!)));
                  },
                      title: 'Kalp Motifi',
                      icon: Icons.draw_outlined,
                      font: font.menuButton!
                  ),
                )
              ),
            ],
          ),
        ));
  }
}
