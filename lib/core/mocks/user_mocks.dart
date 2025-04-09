// Mock user data for development and testing
class UserMocks {
  // Lista para armazenar usuários registrados
  static final List<Map<String, dynamic>> _registeredUsers = [
    {
      'id': '1',
      'name': 'Test User',
      'email': 'test@example.com',
      'phoneNumber': '+258840123456',
      'password':
          'password123', // Em um sistema real, nunca armazenaríamos senhas em texto puro
      'createdAt': DateTime.now().toIso8601String(),
    }
  ];

  // Mock user credentials
  static final Map<String, dynamic> mockUser = _registeredUsers[0];

  // Mock login response
  static Map<String, dynamic> mockLoginResponse(String email, String password) {
    // Procurar usuário pelo email
    final user = _registeredUsers.firstWhere(
      (user) => user['email'] == email,
      orElse: () => {},
    );

    // Verificar se o usuário existe e a senha está correta
    if (user.isNotEmpty && user['password'] == password) {
      // Criar uma cópia do usuário sem a senha para retornar
      final userDTO = Map<String, dynamic>.from(user);
      userDTO.remove('password');

      return {
        'success': true,
        'token': 'mock_jwt_token_${user['id']}',
        'data': {
          'userDTO': userDTO,
        },
      };
    } else {
      return {
        'success': false,
        'message': 'Email ou senha incorretos, tente novamente',
      };
    }
  }

  // Mock registration response
  static Map<String, dynamic> mockRegisterResponse(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) {
    // Verificar se o email já está registrado
    final emailExists = _registeredUsers.any((user) => user['email'] == email);

    if (emailExists) {
      return {
        'success': false,
        'message': 'Este email já está registrado',
      };
    } else {
      // Criar novo usuário
      final newUser = {
        'id': '${DateTime.now().millisecondsSinceEpoch}',
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'password':
            password, // Em um sistema real, nunca armazenaríamos senhas em texto puro
        'createdAt': DateTime.now().toIso8601String(),
      };

      // Adicionar à lista de usuários registrados
      _registeredUsers.add(newUser);

      // Criar uma cópia do usuário sem a senha para retornar
      final userDTO = Map<String, dynamic>.from(newUser);
      userDTO.remove('password');

      return {
        'success': true,
        'message': 'Registro concluído com sucesso',
        'data': {
          'userDTO': userDTO,
        },
      };
    }
  }

  // Método para debug - listar todos os usuários registrados
  static List<Map<String, dynamic>> getAllRegisteredUsers() {
    return _registeredUsers.map((user) {
      final userCopy = Map<String, dynamic>.from(user);
      userCopy.remove('password'); // Não retornar senhas
      return userCopy;
    }).toList();
  }
}
