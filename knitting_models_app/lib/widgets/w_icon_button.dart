import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';

class WIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  const WIconButton(
      {super.key,
        required this.onPressed,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    final col = AppColors();
    return InkWell(
      splashColor: col.secondCol,
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(14.0),
           color: col.fourthCol,
         ),
        child: IconButton(
          onPressed: null,
          style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: col.secondCol,
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              padding: const EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          icon: icon,
        ),
      ),
    );
  }
}
