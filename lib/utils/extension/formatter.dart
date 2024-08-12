import 'package:flutter/services.dart';

extension DateTextInputFormatter on TextInputFormatter {
  static TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String text = newValue.text;

    final String numericString = text.replaceAll(RegExp(r'[^0-9]'), '');

    StringBuffer formatted = StringBuffer();
    if (numericString.length >= 2) {
      formatted.write('${numericString.substring(0, 2)}/');
    }
    if (numericString.length > 2 && numericString.length <= 4) {
      formatted.write(numericString.substring(2));
    } else if (numericString.length > 4) {
      formatted.write('${numericString.substring(2, 4)}/');
      formatted.write(numericString.substring(4, 8));
    }

    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
