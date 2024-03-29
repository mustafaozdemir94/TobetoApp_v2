import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class NotAuthenticated extends AuthState {
  String? errorMessage;

  NotAuthenticated({this.errorMessage});
}

class Authenticated extends AuthState {
  User? user;

  Authenticated({this.user});
}

class AuthLoading extends AuthState {}
