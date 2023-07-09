part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class loginLoading extends LoginState {}

class loginSucces extends LoginState {}

class loginFailure extends LoginState {
  String? errorMassege;

  loginFailure({required this.errorMassege});
}
