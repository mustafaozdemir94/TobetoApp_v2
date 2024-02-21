// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobetoappv2/api/blocs/auth/auth_event.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_state.dart';
import 'package:tobetoappv2/api/repository/auth_repository.dart';
import 'package:tobetoappv2/api/repository/user_repository.dart';
import 'package:tobetoappv2/models/usermodel.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;
  AuthBloc(
    this._authRepository,
    this._firebaseAuth,
    this._userRepository,
  ) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginUser);
    on<RegisterEvent>(_onRegisterUser);
    on<LogoutEvent>(_onUserOut);
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(NotAuthenticated());
      }
    });
  }

  // kullanıcı girişi

  void _onLoginUser(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await _authRepository.loginUser(event.password, event.email);
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } catch (e) {
      emit(NotAuthenticated());
    }
  }

  // kullanıcı oluşturma

  void _onRegisterUser(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await _authRepository.createUser(event.password, event.email, event.username);
      await _userRepository.addUsers(UserModel(email: event.email, username: event.username));
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } catch (e) {
      emit(NotAuthenticated());
    }
  }

  // Çıkış Metodu

  void _onUserOut(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.signoutUser();
    } catch (e) {
      print(e);
    }
  }
}
