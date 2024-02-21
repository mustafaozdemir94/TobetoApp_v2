// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobetoappv2/models/usermodel.dart';

abstract class ProfileEvent {}

// ---------- profil bilgilerini getir

class FetchProfile extends ProfileEvent {}

// ------ profil bilgilerini güncelle

class UpdateProfileEvent extends ProfileEvent {
  UserModel userModel;
  UpdateProfileEvent({
    required this.userModel,
  });
}
