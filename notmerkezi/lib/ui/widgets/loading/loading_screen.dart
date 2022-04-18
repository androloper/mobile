import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if (Platform.isIOS) {
    //   return CupertinoPageScaffold(
    //     backgroundColor: Colors.grey,
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
    //       child: SizedBox(
    //         child: Stack(
    //           children: <Widget>[
    //             Center(
    //               child: Container(
    //                 width: width * .6,
    //                 height: width >= 750 ? height * .5 : height * .35,
    //                 child: CircularProgressIndicator(
    //                   strokeWidth: 4,
    //                   backgroundColor: Colors.indigo,
    //                   color: Colors.amberAccent,
    //                 ),
    //               ),
    //             ),
    //             Center(
    //                 child: Image.asset(
    //                   'assets/nobg-logo.png',
    //                   width: width * 0.4,
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: SizedBox(
              height: height,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: width *.6,
                      height: width >= 750 ? height * .6 : height * .35,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: Colors.indigo,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/nobg-logo.png',
                      width: width * 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
