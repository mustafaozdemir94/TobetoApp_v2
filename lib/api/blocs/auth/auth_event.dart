// repo = event

abstract class AuthEvent {}

// Login Alanı
class LoginEvent extends AuthEvent {
  String email;
  String password;

  LoginEvent({required this.email, required this.password});
}

// Register Alanı
class RegisterEvent extends AuthEvent {
  String email;
  String password;
  String username;
  RegisterEvent({
    required this.email,
    required this.password,
    required this.username,
  });
}

// Çıkış Alanı
class LogoutEvent extends AuthEvent {}
