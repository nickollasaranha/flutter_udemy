class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Email já cadastrado.',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Acesso bloqueado. Tenta novamente mais tarde',
    'EMAIL_NOT_FOUND': 'Email não encontrado.',
    'INVALID_PASSWORD': 'Senha informada não confere',
    'USER_DISABLED': 'A conta do usuário foi desabilitada',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação';
  }
}
