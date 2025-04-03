/// Checks if string is password.
bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  // Se não for obrigatório e estiver vazio, considera válido
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  // Se houver algum valor, verifica se tem pelo menos 6 caracteres
  // Removendo a validação complexa que estava causando problemas
  if (inputString != null && inputString.isNotEmpty) {
    isInputStringValid = inputString.length >= 6;
  }

  return isInputStringValid;
}

/// Checks if string is email.
bool isValidEmail(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

/// Checks if string is phone number
bool isValidPhone(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    String cleanedInput = inputString.replaceAll(' ', '');
    const pattern =
        r'^(?:\+244|244|0)?9[1-9]\d{7}$'; // Permite +244, 244, 0 como prefixo
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(cleanedInput);
  }
  return isInputStringValid;
}
