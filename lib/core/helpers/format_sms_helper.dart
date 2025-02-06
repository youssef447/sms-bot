import 'package:another_telephony/telephony.dart';

abstract class FormatSmsHelper {
  static String formatSms(SmsMessage msg) {
    return 'Sender: ${msg.address}\nmessage: ${msg.body}';
  }
}
