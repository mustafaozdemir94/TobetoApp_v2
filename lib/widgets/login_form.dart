import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_bloc.dart';
import 'package:tobetoappv2/api/blocs/auth/auth_event.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(LoginEvent(email: _email, password: _password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "E-Posta",
                hintStyle: GoogleFonts.ptSans(
                  textStyle: const TextStyle(color: Colors.white),
                ),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                fillColor: Colors.blueGrey, //
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => _email = value!,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Lütfen geçerli bir e-posta adresi giriniz.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Şifre",
                hintStyle: GoogleFonts.ptSans(
                  textStyle: const TextStyle(color: Colors.white),
                ),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                fillColor: Colors.blueGrey, //
                filled: true,
              ),
              obscureText: true,
              onSaved: (value) => _password = value!,
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Şifre en az 8 karakter uzunluğunda olmalıdır.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              _submit();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Giriş Yap",
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
