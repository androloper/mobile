import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';

class WOutlinedIconTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final TextStyle font;
  final bool? isShownDisabled;
  const WOutlinedIconTextButton(
      {super.key,
        required this.onPressed,
        required this.title,
        required this.icon,
        this.isShownDisabled = false,
        required this.font});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final col = AppColors();
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: isShownDisabled==true ? col.secondCol : col.fourthCol,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      child: Ink(
        width: width,
        height: height * .07,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isShownDisabled==true ? [col.secondCol, col.thirdCol]: [col.thirdCol, col.firstCol, col.fourthCol],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: EdgeInsets.only(left: width * .075),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: width * .05),
                child: Icon(
                  icon,
                  size: height * .04,
                  color: isShownDisabled==true ? col.secondCol : col.fourthCol,
                ),
              ),
              Text(title, style: font)
            ],
          ),
        ),
      ),
    );
  }
}
