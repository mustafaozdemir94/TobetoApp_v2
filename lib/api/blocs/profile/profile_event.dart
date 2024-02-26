// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:tobetoappv2/models/usermodel.dart';

abstract class ProfileEvent {}

// ---------- profil bilgilerini getir

class FetchProfile extends ProfileEvent {}

// ------ profil bilgilerini güncelle

class UpdateProfileEvent extends ProfileEvent {
  final UserModel userModel;
  final File? photo;
  UpdateProfileEvent({
    this.photo,
    required this.userModel,
  });
}
