import 'package:flutter/material.dart';

Route WPageRouteBuilderForListItem(placementY, screenToGo) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screenToGo,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeIn;
      final tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
      return ScaleTransition(
        alignment: Alignment(0, placementY),
        scale: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route WPageRouteBuilderForMenu(placementX, placementY, screenToGo) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => screenToGo,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeIn;
      final tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
      return ScaleTransition(
        alignment: Alignment(placementX, placementY),
        scale: animation.drive(tween),
        child: child,
      );
    },
  );
}