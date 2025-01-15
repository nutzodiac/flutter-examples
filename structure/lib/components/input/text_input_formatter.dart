import 'package:flutter/services.dart';

class LaserCodeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String formatted = formatString(newValue.text.toUpperCase());
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String formatString(String input) {
    // Remove any non-numeric characters
    String cleanedInput = input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    // Limit input to 12 characters
    if (cleanedInput.length > 12) {
      cleanedInput = cleanedInput.substring(0, 12);
    }

    // Define the format positions and lengths
    List<int> positions = [3, 10];
    List<int> lengths = [3, 7, 2];

    // Check if input length matches the expected total length
    if (cleanedInput.length != positions.last + lengths.last) {
      return cleanedInput; // Return original if lengths don't match
    }

    // Construct the formatted string
    String formattedString = '${cleanedInput.substring(0, positions[0])}-${cleanedInput.substring(positions[0], positions[1])}-${cleanedInput.substring(positions[1], positions[1] + lengths[2])}';

    return formattedString;
  }
}