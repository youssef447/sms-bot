import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_sender/core/globals/globals.dart';
import 'package:sms_sender/core/helpers/format_sms_helper.dart';
import 'package:sms_sender/core/services/sms_service.dart';
import 'package:sms_sender/core/widgets/loading/loading.dart';

import 'package:another_telephony/telephony.dart';
import '../../core/constants/app_assets.dart';
import '../../core/helpers/get_dialog_helper.dart';
import '../../core/widgets/dialogs/default_dialog.dart';

class SmsController extends GetxController {
  List<SmsMessage> smsList = [];

  late final Telephony telephony = Telephony.instance;

  bool loading = true;
  String errorMessage = '';
  List<bool> checkboxes = [];
  @override
  onInit() {
    super.onInit();
    getSms();
  }

  Future<void> getSms() async {
    try {
      smsList = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
        sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
      );
      checkboxes = List.generate(smsList.length, (i) => false);
      loading = false;

      update();
    } catch (e) {
      loading = false;
      errorMessage = e.toString();

      update();
    }
  }

  Future<void> sendSms() async {
    try {
      bool hasSelection = false;
      String messages = '';
      showLoadingIndicator();

      for (int i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i]) {
          hasSelection = true;

          messages += '${FormatSmsHelper.formatSms(smsList[i])}\n\n';
        }
      }
      if (hasSelection) {
        if (email != null && chatID != null) {
          await Future.wait([
            SmsService.instance
                .sendToEmail(email: email!, directMessage: messages),
            SmsService.instance
                .sendToTelegram(chaID: chatID!, directMessage: messages),
          ]);

          checkboxes = List.generate(smsList.length, (i) => false);
          showCheckboxes = false;
          update();
          hideLoadingIndicator();

          GetDialogHelper.generalDialog(
            child: const DefaultDialog(
              lottieAsset: AppAssets.success,
              title: 'Success',
              subTitle: 'Messages sent successfully',
              autoClose: true,
            ),
            context: Get.context!,
          );
        } else {
          hideLoadingIndicator();
          Get.snackbar(
            'Warning',
            'Please Fill Email and User ID in Settings',
            backgroundColor: Get.context!.theme.colorScheme.primary,
            colorText: Colors.white,
          );
        }
      } else {
        hideLoadingIndicator();
        Get.snackbar(
          'Warning',
          'Please Select at least one message',
          backgroundColor: Get.context!.theme.colorScheme.primary,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      hideLoadingIndicator();

      GetDialogHelper.generalDialog(
        child: DefaultDialog(
          lottieAsset: AppAssets.trash,
          title: 'Error',
          subTitle: e.toString(),
          autoClose: true,
        ),
        context: Get.context!,
      );
    }
  }

  bool showCheckboxes = false;
  toggleShowCheckboxes() {
    showCheckboxes = !showCheckboxes;
    if (!showCheckboxes) {
      checkboxes = List.generate(smsList.length, (i) => false);
    }
    update();
  }

  toggleCheckboxIndex(bool val, int index) {
    checkboxes[index] = val;
    update(['checkbox $index']);
  }
}
