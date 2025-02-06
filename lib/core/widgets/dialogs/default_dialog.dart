import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class DefaultDialog extends StatelessWidget {
  final dynamic Function()? onConfirm;
  final String lottieAsset;
  final String title;
  final String subTitle;
  final bool showButtons;
  final bool autoClose;
  final String? okButtonText;
  final String? cancelButtonText;
  final double? width;

  const DefaultDialog({
    super.key,
    this.onConfirm,
    required this.lottieAsset,
    required this.title,
    required this.subTitle,
    this.showButtons = false,
    this.okButtonText,
    this.cancelButtonText,
    this.autoClose = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (autoClose) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xff0b1739),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 8.w,
      ),
      width: width ?? Get.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            height: 104.h,
            margin: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: LottieBuilder.asset(
              lottieAsset,
              frameRate: const FrameRate(120),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
