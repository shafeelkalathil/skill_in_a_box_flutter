
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {

  AuthSuccess(this.accessToken, this.refreshToken);
  final String accessToken;
  final String refreshToken;
}

class AuthFailure extends AuthState {

  AuthFailure(this.message);
  final String message;
}
