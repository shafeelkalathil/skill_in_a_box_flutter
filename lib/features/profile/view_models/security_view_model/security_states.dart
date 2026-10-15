abstract class SecurityState {}

class SecurityInitial implements SecurityState {}

class SecurityLoading implements SecurityState {}

class SecuritySuccess implements SecurityState {}

class SecurityFailed implements SecurityState {
  SecurityFailed({required this.errorMessage});

  final String errorMessage;
}
