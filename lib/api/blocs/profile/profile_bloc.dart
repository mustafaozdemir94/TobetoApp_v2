// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/api/repository/user_repository.dart';
import 'package:tobetoappv2/models/usermodel.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  ProfileBloc(
    this._userRepository,
  ) : super(ProfileInitial()) {
    on<FetchProfile>(_onFetchProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

// profil getirme

  Future<void> _onFetchProfile(FetchProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = await _userRepository.fetchUsers(UserModel());
      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

//profil güncelleme

  Future<void> _onUpdateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {}
}
