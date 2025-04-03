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

bool isValidPhone(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  }

  // Extract just the digits
  final cleaned = inputString?.replaceAll(RegExp(r'[^\d+]'), '') ?? '';

  // Check for international format: +244 followed by 9 digits starting with 9
  if (cleaned.startsWith('+244')) {
    return cleaned.length == 13 &&
        RegExp(r'^\+2449[1-9]\d{7}$').hasMatch(cleaned);
  }

  // Check for format with just 244 prefix
  if (cleaned.startsWith('244')) {
    return cleaned.length == 12 &&
        RegExp(r'^2449[1-9]\d{7}$').hasMatch(cleaned);
  }

  // Check for local format (just 9 digits)
  return cleaned.length == 9 && RegExp(r'^9[1-9]\d{7}$').hasMatch(cleaned);
}
