import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class NumberFormatUtils {
  static String convertNumberToStringComma(double number) {
    NumberFormat formatter = NumberFormat('#,###,##0.00');
    return formatter.format(number);
  }
  static String convertNumberToStringComma3(double number) {
    NumberFormat formatter = NumberFormat('#,###,##0.000');
    return formatter.format(number);
  }

  static String convertNumberToStringComma4(double number) {
    NumberFormat formatter = NumberFormat('#,###,##0.0000');
    return formatter.format(number);
  }

  static String convertNumberToStringComma6(double number) {
    NumberFormat formatter = NumberFormat('#,###,##0.000000');
    return formatter.format(number);
  }

  static String convertNumberToStringCommaNoDecimal(double number) {
    NumberFormat formatter = NumberFormat('#,###');
    // return formatter.format(number);
    double removeDec = double.parse(number.toString().split('.').first);
    return formatter.format(removeDec);
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
