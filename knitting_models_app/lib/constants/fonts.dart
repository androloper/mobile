import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knitting_models_app/constants/colors.dart';

final col = AppColors();

class AppFonts {
  final TextStyle? squareButtonFont = GoogleFonts.rowdies(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: col.secondCol));
  final TextStyle? formSubHeader = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: col.secondCol));
  final TextStyle? formText = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: col.fourthCol));
  final TextStyle? appBarText = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: col.fourthCol));
  final TextStyle? formButton = GoogleFonts.rowdies(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: col.secondCol));
  final TextStyle? menuButton = GoogleFonts.rowdies(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: col.secondCol));
  final TextStyle? notificationText = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: col.uniSecondCol));
  final TextStyle? notificationHeader = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: col.uniSecondCol));
  final TextStyle? notificationContent = GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: col.uniSecondCol));
}