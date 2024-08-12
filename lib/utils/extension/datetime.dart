import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatDateTime {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }

  bool get isAtLeast18YearsOld {
    final DateTime today = DateTime.now();
    final int age = today.year - year;

    if (age > 18) {
      return true;
    } else if (age == 18) {
      if (today.month > month) {
        return true;
      } else if (today.month == month) {
        return today.day >= day;
      }
    }

    return false;
  }
}
