import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawKnitting extends StatefulWidget {
  final int row;
  final int col;
  const DrawKnitting({required this.row, required this.col, super.key});

  @override
  State<DrawKnitting> createState() => _DrawKnittingState();
}

class _DrawKnittingState extends State<DrawKnitting> {
  late int rowCount;
  late int columnCount;
  late List<List<bool>> gridState;
  final col = AppColors();
  final font = AppFonts();
  late TextEditingController motifController;

  @override
  void initState() {
    super.initState();
    motifController = TextEditingController(text: '');
    rowCount = widget.row;
    columnCount = widget.col;
    resetCells();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col.thirdCol,
      appBar: AppBar(title: Text("Motif Oluştur", style: font.appBarText,)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: CupertinoButton(
                    color: col.fourthCol,
                    onPressed: resetCells,
                    child: Text("Sıfırla", style: font.formButton,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: CupertinoButton(
                    color: col.fourthCol,
                    onPressed: () async {
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: Text('Motifi Kaydet',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: col.fourthCol)),
                                content: TextFormField(
                                  enabled: true,
                                  controller: motifController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  cursorColor: col.fourthCol,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                    hintText: 'Motif Adı',
                                  ),
                                  style: font.formText,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context).textTheme.labelLarge,
                                      foregroundColor: col.thirdCol,
                                    ),
                                    child: const Text('Vazgeç'),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context).textTheme.labelLarge,
                                      foregroundColor: col.fourthCol,
                                    ),
                                    child: const Text('Kaydet'),
                                    onPressed: () async {
                                      final prefs = await SharedPreferences.getInstance();
                                      final savedJson = saveCells();
                                      prefs.setString(motifController.text, savedJson);
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );

                      if (result == true) {
                        setState(() {});
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Kaydet",  style: font.formButton,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void resetCells() {
    setState(() {
      gridState = List.generate(rowCount, (_) => List.generate(columnCount, (_) => false));
    });
  }
  void drawCell(int row, int col) {
    setState(() {
      gridState[row][col] = !gridState[row][col];
    });
  }
  String saveCells() {
    String jsonData = gridState.map((row) => row.map((cell) => cell ? 1 : 0).toList()).toList().toString();
    debugPrint("Saved JSON: $jsonData");
    // this is where we will be calling the api
    return jsonData;
  }
}
