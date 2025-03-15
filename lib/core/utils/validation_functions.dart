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
    if (inputString.length > 16 || inputString.length < 6) return false;
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[) ]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}
