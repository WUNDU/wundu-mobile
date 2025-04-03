import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final oldText = oldValue.text;

    // Permite apenas dígitos e '+'
    String cleanedText = text.replaceAll(RegExp(r'[^\d+]'), '');

    String prefix = '';
    String numberPart = '';

    // Identificar o prefixo
    if (cleanedText.startsWith('+244')) {
      prefix = '+244';
      numberPart = cleanedText.substring(4);
    } else if (cleanedText.startsWith('244')) {
      prefix = '244';
      numberPart = cleanedText.substring(3);
    } else if (cleanedText.startsWith('0')) {
      prefix = '0';
      numberPart = cleanedText.substring(1);
    } else {
      numberPart = cleanedText;
    }

    // Limitar a parte numérica a 9 dígitos
    numberPart = numberPart.replaceAll(RegExp(r'[^\d]'), '');
    if (numberPart.length > 9) {
      numberPart = numberPart.substring(0, 9);
    }

    // Formatar a parte numérica com espaços
    String formattedNumber = '';
    for (int i = 0; i < numberPart.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formattedNumber += ' ';
      }
      formattedNumber += numberPart[i];
    }

    // Combinar prefixo e número formatado
    String result = prefix;
    if (prefix.isNotEmpty && formattedNumber.isNotEmpty) {
      result += ' ';
    }
    result += formattedNumber;

    // Manter o cursor na posição correta
    int cursorPosition = result.length;
    if (oldText.length >= text.length) {
      cursorPosition = newValue.selection.baseOffset;
    }

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
