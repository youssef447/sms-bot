import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_sender/core/theme/app_text_style.dart';

import '../../constants/app_assets.dart';

/// Objectives: This file is responsible for providing the default no data gif.
class NoDataGif extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function() onRetry;
  const NoDataGif({super.key, this.height, this.width, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          height: height ?? Get.height * 0.35,
          width: Get.width * 0.7,
          AppAssets.empty,
          frameRate: const FrameRate(120),
        ),
        Text(
          'No Data Found'.tr,
          style: AppTextStyle.font20BoldText,
        ),
        SizedBox(
          height: 15.h,
        ),
        TextButton.icon(
          onPressed: onRetry,
          icon: Icon(
            Icons.refresh_rounded,
            size: 22.sp,
          ),
          label: Text(
            'Retry',
            style: AppTextStyle.font16BoldText,
          ),
        )
      ],
    );
  }
}
