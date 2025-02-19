import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sms_sender/core/constants/app_assets.dart';
import 'package:sms_sender/core/helpers/validation_helper.dart';
import 'package:sms_sender/core/widgets/animations/scale_animation.dart';
import 'package:sms_sender/core/widgets/fields/default_form_field.dart';

import '../../../core/theme/app_text_style.dart';
import '../../controller/sms_settings_controller.dart';
part '../widgets/settings_page/inputs_form.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        shadowColor: Colors.transparent,
        toolbarHeight: 60.h,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: SvgPicture.asset(
                AppAssets.arrowBack,
                color: Colors.white,
              ),
            )),
        title: Text(
          'Settings',
          style: AppTextStyle.font20BoldText,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: GetBuilder<SmsSettingsController>(
              init: SmsSettingsController(),
              builder: (controller) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleAnimation(
                        child: SvgPicture.asset(
                          AppAssets.form,
                          width: 140.w,
                          height: 140.h,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      const InputsForm(),
                      SizedBox(height: 100.h),
                      GestureDetector(
                        onTap: () {
                          controller.saveInput();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 55.w,
                          ),
                          child: Text(
                            'Save',
                            style: AppTextStyle.font18BoldText,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
