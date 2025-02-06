import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sms_sender/core/helpers/route_navigation_helper.dart';
import 'package:sms_sender/core/widgets/animations/horizontal_animation.dart';
import 'package:sms_sender/core/widgets/checkbox/app_checkbox.dart';

import 'package:another_telephony/telephony.dart';
import 'package:sms_sender/core/helpers/date_format_helper.dart';
import 'package:sms_sender/core/widgets/no_data/no_data_gif.dart';
import 'package:sms_sender/presentation/controller/sms_controller.dart';
import 'package:sms_sender/presentation/ui/pages/settings_page.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/error/error_gif.dart';
import '../../../core/widgets/loading/circle_progress.dart';

part '../widgets/sms_page/sms_card.dart';
part '../widgets/sms_page/sms_appbar.dart';

class SmsPage extends StatelessWidget {
  const SmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsController>(
        init: SmsController(),
        builder: (controller) {
          if (controller.loading) {
            return const Scaffold(body: CircleProgress());
          }
          if (controller.errorMessage.isNotEmpty) {
            return Scaffold(
              body: Center(
                child: ErrorGif(
                    errorMessage: controller.errorMessage,
                    onRetry: () {
                      controller.getSms();
                    }),
              ),
            );
          }
          if (controller.smsList.isEmpty) {
            return Scaffold(
              body: Center(
                child: NoDataGif(onRetry: () {
                  controller.getSms();
                }),
              ),
            );
          }
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (controller.showCheckboxes == false) {
                SystemNavigator.pop();
              } else {
                controller.toggleShowCheckboxes();
              }
            },
            child: Scaffold(
                appBar: const SmsAppbar(),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    await controller.sendSms();
                  },
                  shape: const CircleBorder(),
                  child: SvgPicture.asset(
                    AppAssets.send,
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
                body: SafeArea(
                    child: SlideAnimation(
                  leftToRight: true,
                  child: ListView.separated(
                    padding: EdgeInsets.all(16.h),
                    itemBuilder: (context, index) {
                      return GetBuilder<SmsController>(
                          id: 'checkbox $index',
                          builder: (controller) {
                            return Row(
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (child, animation) {
                                    return SizeTransition(
                                      sizeFactor: animation,
                                      axis: Axis.horizontal,
                                      child: child,
                                    );
                                  },
                                  child: controller.showCheckboxes
                                      ? Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 5.w),
                                          child: AppCheckbox(
                                            value: controller.checkboxes[index],
                                            onChanged: (v) {
                                              controller.toggleCheckboxIndex(
                                                v ?? false,
                                                index,
                                              );
                                            },
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.showCheckboxes) {
                                        controller.toggleCheckboxIndex(
                                          !controller.checkboxes[index],
                                          index,
                                        );
                                      }
                                    },
                                    onLongPress: () {
                                      if (controller.showCheckboxes == false) {
                                        controller.toggleShowCheckboxes();
                                        controller.toggleCheckboxIndex(
                                          true,
                                          index,
                                        );
                                      }
                                    },
                                    child: SmsCard(
                                      model: controller.smsList[index],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    separatorBuilder: (_, __) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: controller.smsList.length,
                  ),
                ))),
          );
        });
  }
}
