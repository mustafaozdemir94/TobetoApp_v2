import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_bloc.dart';
import 'package:tobetoappv2/api/blocs/course/course_bloc.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/repository/auth_repository.dart';
import 'package:tobetoappv2/api/repository/course_repository.dart';
import 'package:tobetoappv2/api/repository/storage_repository.dart';
import 'package:tobetoappv2/api/repository/user_repository.dart';
import 'package:tobetoappv2/firebase_options.dart';
import 'package:tobetoappv2/screens/splash_screen.dart';
import 'package:tobetoappv2/screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final courseRepo = CourseRepository();
  final userRepo = UserRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(StorageRepository(), userRepo)),
      BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthRepository(), FirebaseAuth.instance, userRepo)),
      BlocProvider<CourseBloc>(create: (context) => CourseBloc(courseRepository: courseRepo)),
      BlocProvider<CourseDetailBloc>(create: (context) => CourseDetailBloc(courseRepository: courseRepo))
    ],
    child: const MaterialApp(
      //theme: ThemeData(useMaterial3: true),
      home: StartPage(),
    ),
  ));
}
