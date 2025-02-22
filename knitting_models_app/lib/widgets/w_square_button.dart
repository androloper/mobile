import 'dart:async';
import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';

class WSquareButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Function onProcessChanged;
  final IconData icon;
  final String title;
  final TextStyle font;
  final bool? isShownDisabled;
  final bool? isProcessWaiting;
  final List<dynamic>? touchPoints;
  const WSquareButton({
    super.key,
    required this.onPressed,
    required this.onProcessChanged,
    required this.icon,
    required this.title,
    required this.font,
    this.isShownDisabled = false,
    this.isProcessWaiting = false,
    this.touchPoints,
  });

  @override
  State<WSquareButton> createState() => _WSquareButtonState();
}

class _WSquareButtonState extends State<WSquareButton> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final col = AppColors();
    var elevation = 15.0;
    return Card(
      margin: EdgeInsets.all(width * .03),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(width: 1, color: col.secondCol),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: widget.isProcessWaiting == false ?
            () {
          if(widget.touchPoints == null || widget.touchPoints!.length > 1){
            return;
          }
          widget.onProcessChanged(true);
          widget.onPressed();
        }
            : null,
        child: Ink(
          padding: EdgeInsets.fromLTRB(width * .02, width * .02, width * .02, width * .0005),
          width: width * .4,
          height: height * .24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: widget.isShownDisabled == true
                  ? [Colors.black12, Colors.grey]
                  : [col.firstCol, col.fourthCol, col.fourthCol, col.fourthCol, col.firstCol],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .12,
                width: width * .4,
                child: Icon(widget.icon,
                    size: height * .08,
                    color: col.secondCol),
              ),
              SizedBox(
                height: height * .1,
                width: width * .9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.title,
                    style: widget.font,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
// void _toggleAnimation() {
//   if (_isAnimating) {
//     _controller.stop(); // Stop the animation if it's running
//     _controller.reset();
//   } else {
//     _controller.repeat(reverse: false); // Start the animation
//   }
//   _isAnimating = !_isAnimating; // Toggle the flag
//   setState(() {});
// }
}

