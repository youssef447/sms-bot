import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_sender/core/helpers/app_context.dart';

abstract class AppTextStyle {
  static final TextStyle font20BoldText = Theme.of(AppContext.getContext!)
      .textTheme
      .displayLarge!
      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold);
  static final TextStyle font18BoldText = Theme.of(AppContext.getContext!)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold);
  static final TextStyle font16BoldText = Theme.of(AppContext.getContext!)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold);
  static final TextStyle font14BoldText = Theme.of(AppContext.getContext!)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold);
  static final TextStyle font12BoldText = Theme.of(AppContext.getContext!)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold);
  static final TextStyle font10BoldText = Theme.of(AppContext.getContext!)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold);
}
