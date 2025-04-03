import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Check if we're deleting
    bool isDeleting = oldValue.text.length > newValue.text.length;

    // Get just the digits
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d+]'), '');

    // Always ensure we have the +244 prefix
    String prefix = '+244';
    String phoneDigits = '';

    // Extract the phone number part
    if (digitsOnly.startsWith('+244')) {
      phoneDigits = digitsOnly.substring(4);
    } else if (digitsOnly.startsWith('244')) {
      phoneDigits = digitsOnly.substring(3);
    } else if (digitsOnly.startsWith('+')) {
      phoneDigits = digitsOnly;
      if (phoneDigits.length > 1) {
        phoneDigits = phoneDigits.substring(1);
      } else {
        phoneDigits = '';
      }
    } else {
      phoneDigits = digitsOnly;
    }

    // Limit to exactly 9 digits for the phone part
    if (phoneDigits.length > 9) {
      phoneDigits = phoneDigits.substring(0, 9);
    }

    // Format with spaces after every 3 digits
    String formatted = '';
    for (int i = 0; i < phoneDigits.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formatted += ' ';
      }
      formatted += phoneDigits[i];
    }

    // Construct the final result
    String result = formatted.isEmpty ? prefix : '$prefix $formatted';

    // If deleting and at the prefix boundary, prevent deletion of prefix
    if (isDeleting && oldValue.text.length <= prefix.length + 1) {
      result = prefix;
    }

    // Calculate the new cursor position
    int newCursorPosition = result.length;
    if (newValue.selection.baseOffset < newValue.text.length) {
      // Try to keep the cursor at a sensible position
      newCursorPosition = result.length -
          (newValue.text.length - newValue.selection.baseOffset);
      newCursorPosition = newCursorPosition.clamp(prefix.length, result.length);
    }

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}
