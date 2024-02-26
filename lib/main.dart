// Tekrar dersinin 01.11 saatinde kaldım.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/repository/auth_repository.dart';
import 'package:tobetoappv2/api/repository/storage_repository.dart';
import 'package:tobetoappv2/api/repository/user_repository.dart';
import 'package:tobetoappv2/firebase_options.dart';
import 'package:tobetoappv2/screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(StorageRepository(), UserRepository())),
      BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthRepository(), FirebaseAuth.instance, UserRepository()))
    ],
    child: const MaterialApp(
      home: StartPage(),
    ),
  ));
}
// BLoC
// Firebase


// git rm . --cached -rf 
// git add .
// git commit -m "remove files"
// git push origin branch