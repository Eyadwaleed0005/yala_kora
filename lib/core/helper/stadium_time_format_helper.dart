import 'package:intl/intl.dart';

class StadiumTimeFormatHelper {
  StadiumTimeFormatHelper._();

  static String formatSlotLabel(DateTime dt, {String locale = 'ar'}) {
    final text = DateFormat('h:mm a', locale).format(dt);

    return text
        .replaceAll('AM', 'ص')
        .replaceAll('PM', 'م')
        .replaceAll('am', 'ص')
        .replaceAll('pm', 'م')
        .replaceAll('صباحًا', 'ص')
        .replaceAll('مساءً', 'م')
        .replaceAll('صباحاً', 'ص')
        .replaceAll('مساءً', 'م')
        .replaceAll('مساءً', 'م')
        .trim();
  }
}
