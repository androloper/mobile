import 'dart:async';
import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';
import 'package:knitting_models_app/screens/draw_knitting.dart';
import 'package:knitting_models_app/screens/knitting_models.dart';
import 'package:knitting_models_app/screens/login.dart';
import 'package:knitting_models_app/widgets/w_icon_button.dart';
import 'package:knitting_models_app/widgets/w_page_route_builder.dart';
import 'package:knitting_models_app/widgets/w_square_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<List<bool>> gridState;
  var _touchPoints = [];
  late double placementY;
  late double placementX;
  var isProcessWaiting = false;
  final col = AppColors();
  final font = AppFonts();

  @override
  void initState() {
    super.initState();
  }

  onProcessChanged(bool processState) {
    isProcessWaiting = processState;
    Timer.periodic(const Duration(seconds: 2), (timer) {
      timer.cancel();
      isProcessWaiting = false;
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.jpg"),
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fill))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width*.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Listener(
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
                          child: WIconButton(
                              onPressed: () async {
                                //Shared Preferences will be deleted here then redirect to login screen
                                await Navigator.of(context).push(WPageRouteBuilderForMenu(
                                    placementX,
                                    placementY,
                                    LoginScreen()));
                              },
                              icon: Icon(
                                Icons.logout,
                                size: width > 600 ? width * .03 : width * .06,
                                color: col.secondCol,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Listener(
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
                        child: WSquareButton(
                          touchPoints: _touchPoints,
                          isProcessWaiting: isProcessWaiting,
                          title: 'Motif Oluştur',
                          icon: Icons.format_color_fill,
                          font: font.squareButtonFont!,
                          onProcessChanged: onProcessChanged,
                          onPressed: () async {
                            // final prefs = await SharedPreferences.getInstance();
                            await Navigator.of(context).push(WPageRouteBuilderForMenu(
                                placementX,
                                placementY,
                                DrawKnitting(row: 16, col: 9,
                                )));
                            isProcessWaiting = false;
                            setState(() {});
                          },
                        ),
                      ),
                      Listener(
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
                        child: WSquareButton(
                          touchPoints: _touchPoints,
                          isProcessWaiting: isProcessWaiting,
                          title: 'Örgü Motiflerim',
                          icon: Icons.draw_rounded,
                          font: font.squareButtonFont!,
                          onProcessChanged: onProcessChanged,
                          onPressed: () async {
                            // final prefs = await SharedPreferences.getInstance();
                            await Navigator.of(context).push(WPageRouteBuilderForMenu(
                                placementX,
                                placementY,
                                KnittingModelsScreen()));
                            isProcessWaiting = false;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
