import 'package:flutter/material.dart';

abstract class GetDialogHelper {
  static Future generalDialog({
    required Widget child,
    required BuildContext context,
    bool? barrierDismissible,
  }) {
    return showGeneralDialog(
        barrierLabel: "",
        barrierDismissible: barrierDismissible ?? true,
        context: context,
        transitionDuration: const Duration(
          milliseconds: 400,
        ),
        pageBuilder: (_, __, ___) {
          return Dialog(
            clipBehavior: Clip.none,
            insetPadding: EdgeInsets.zero,
            backgroundColor: const Color(0xff0b1739),
            elevation: 0,
            shadowColor: Colors.transparent,
            child: child,
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          );
        });
  }
}
