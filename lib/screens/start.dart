import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_bloc.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_state.dart';
import 'package:tobetoappv2/screens/auth.dart';
import 'package:tobetoappv2/screens/home_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) return const HomeScreen();
      return const AuthPage();
    });
  }
}
