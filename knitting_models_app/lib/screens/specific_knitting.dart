import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecificKnittingScreen extends StatefulWidget {
  final int row;
  final int col;
  final String jsonData;
  final String header;
  const SpecificKnittingScreen({required this.row, required this.col, required this.header, required this.jsonData, super.key});

  @override
  State<SpecificKnittingScreen> createState() => _SpecificKnittingScreenState();
}

class _SpecificKnittingScreenState extends State<SpecificKnittingScreen> {
  late int rowCount;
  late int columnCount;
  late List<List<bool>> gridState;
  final col = AppColors();
  final font = AppFonts();

  @override
  void initState() {
    super.initState();
    rowCount = widget.row;
    columnCount = widget.col;
    loadCells();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col.thirdCol,
      appBar: AppBar(title: Text(widget.header, style: font.appBarText,)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columnCount,
                ),
                itemCount: rowCount * columnCount,
                itemBuilder: (context, index) {
                  int rowCtr = index ~/ columnCount;
                  int colCtr = index % columnCount;
                  return GestureDetector(
                    onTap: () => drawCell(rowCtr, colCtr),
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      color: gridState[rowCtr][colCtr] ? col.fourthCol : Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadCells() {
      List<dynamic> decodedJson = jsonDecode(widget.jsonData);
      gridState = decodedJson.map<List<bool>>((row) {
        return row.map<bool>((cell) => cell == 1).toList();
      }).toList();
  }
  void drawCell(int row, int col) {
    setState(() {
      gridState[row][col] = !gridState[row][col];
    });
  }

}
