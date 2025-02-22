import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';
import 'package:toastification/toastification.dart';

class WToast extends StatefulWidget {
  final BuildContext context;
  final double width;
  final String header;
  final String content;
  final int placement;
  final int type;
  final Function()? pageNavigation;
  final String itemId;

  const WToast(
      {required this.context,
        required this.width,
        required this.header,
        required this.content,
        required this.placement,
        required this.type,
        required this.itemId,
        this.pageNavigation});

  static void show(
      {required BuildContext context,
        required double width,
        required String header,
        required String content,
        required int placement,
        required int type,
        Function()? pageNavigation}) {
    Toastification().showCustom(
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      context: context,
      builder: (context, item) {
        return WToast(
          context: context,
          width: width,
          header: header,
          content: content,
          placement: placement,
          type: type,
          pageNavigation: pageNavigation,
          itemId: item.id,
        );
      },
      alignment: placement == ToastPlacementEnum.top
          ? Alignment.topCenter
          : placement == ToastPlacementEnum.center
          ? Alignment.center
          : Alignment.bottomCenter,
      animationDuration: const Duration(milliseconds: 600),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  @override
  State<WToast> createState() => _WToast();
}

class _WToast extends State<WToast> {
  double _opacity = 1.0;
  double _offset = 0.0;

  @override
  Widget build(BuildContext context) {
    final col = AppColors();
    final font = AppFonts();

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Center(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            _offset += details.primaryDelta!;
            _opacity = 1 - (_offset.abs() / 50).clamp(0.0, 1.0);
            setState(() {});
          },
          onHorizontalDragEnd: (details) {
            if (_opacity <= 0.0) {
              _opacity = 0.0;
              Toastification().dismissById(widget.itemId);
            } else {
              _opacity = 1.0;
              _offset = 0.0;
            }
            setState(() { });
          },
          onVerticalDragUpdate: (details) {
            _offset += details.primaryDelta!;
            _opacity = 1 - (_offset.abs() / 50).clamp(0.0, 1.0);
            setState(() {});
          },
          onVerticalDragEnd: (drag) {
            if (_opacity <= 0.0) {
              _opacity = 0.0;
              Toastification().dismissById(widget.itemId);
            } else {
              _opacity = 1.0;
              _offset = 0.0;
            }
            setState(() { });
          },
          // onHorizontalDragEnd: (drag) {
          //   if (drag.primaryVelocity != null && drag.primaryVelocity! > 0) {
          //     Toastification().dismissById(widget.itemId);
          //   }
          // },
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: widget.width * .9,
              padding: widget.pageNavigation != null
                  ? const EdgeInsets.fromLTRB(12, 16, 0, 16)
                  : const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: col.uniFourthCol.withOpacity(.95),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.type == ToastTypeEnum.success
                      ? Colors.greenAccent
                      : widget.type == ToastTypeEnum.error
                      ? Colors.redAccent
                      : widget.type == ToastTypeEnum.warning
                      ? Colors.amberAccent
                      : widget.type == ToastTypeEnum.notification
                      ? col.uniFirstCol
                      : col.uniSecondCol,
                  width: 3,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/unifortunately.png',
                    width: widget.width * .2,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.header != '')
                          Text(widget.header,
                              style: font.notificationHeader),
                        if (widget.content != '')
                          Text(widget.content,
                              style: widget.header == ''
                                  ? font.notificationHeader
                                  : font.notificationContent),
                      ],
                    ),
                  ),
                  widget.pageNavigation != null
                      ? Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: IconButton(
                        onPressed: widget.pageNavigation,
                        icon: Icon(
                          FeatherIcons.arrowRight,
                          size: 32,
                          color: col.uniSecondCol,
                        )),
                  )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToastPlacementEnum {
  static int top = 1;
  static int center = 2;
  static int bottom = 3;
}

class ToastTypeEnum {
  static int success = 1;
  static int error = 2;
  static int warning = 3;
  static int notification = 4;
  static int firebaseNotification = 5;
}
