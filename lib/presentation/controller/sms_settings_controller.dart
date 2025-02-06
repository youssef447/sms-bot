import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_sender/core/globals/globals.dart';

import '../../core/constants/app_assets.dart';
import '../../core/helpers/get_dialog_helper.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/widgets/dialogs/default_dialog.dart';
import '../../core/widgets/loading/loading.dart';

class SmsSettingsController extends GetxController {
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController telegramController = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  onInit() {
    super.onInit();
    emailController.text = email ?? '';
    telegramController.text = chatID ?? '';
  }

  saveInput() async {
    try {
      if (formKey.currentState!.validate()) {
        showLoadingIndicator();
        await Future.wait(
          [
            LocalStorageService.saveSecureData(
                key: 'email', value: emailController.text),
            LocalStorageService.saveSecureData(
                key: 'chatID', value: telegramController.text)
          ],
        );
        hideLoadingIndicator();

        email = emailController.text;
        chatID = telegramController.text;

        GetDialogHelper.generalDialog(
          child: const DefaultDialog(
            lottieAsset: AppAssets.success,
            title: 'Success',
            subTitle: 'Info stored successfully',
            autoClose: true,
          ),
          context: Get.context!,
        );
      }
    } catch (e) {
      hideLoadingIndicator();

      GetDialogHelper.generalDialog(
        child: DefaultDialog(
          lottieAsset: AppAssets.trash,
          title: 'Error',
          subTitle: 'Error Storing Fields, $e',
          autoClose: true,
        ),
        context: Get.context!,
      );
    }
  }
}
