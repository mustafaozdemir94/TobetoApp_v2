import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/blocs/auth/auth_bloc.dart';
import 'package:tobetoappv2/blocs/auth/auth_event.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _username = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(Register(email: _email, password: _password, username: _username));
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
                hintText: "Kullanıcı Adı",
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
              keyboardType: TextInputType.text,
              onSaved: (value) => _username = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen bir kullanıcı adı giriniz.';
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
          const SizedBox(height: 10),
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
                child: Text("Kayıt Ol",
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
