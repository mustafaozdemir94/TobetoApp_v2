// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/api/repository/storage_repository.dart';
import 'package:tobetoappv2/api/repository/user_repository.dart';
import 'package:tobetoappv2/models/usermodel.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final StorageRepository _storageRepository;
  final UserRepository _userRepository;
  ProfileBloc(
    this._storageRepository,
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

  Future<void> _onUpdateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    String url;

    try {
      if (event.photo != null) {
        url = await _storageRepository.uploadPhoto(event.photo!);
        event.userModel.profilephoto = url;
      }

      await _userRepository.updateUsers(event.userModel);
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }
  //
  //
}
