import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/widgets/login_form.dart';
import 'package:tobetoappv2/widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget formWidget = _isLogin ? const LoginForm() : const RegisterForm();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/666.png'))),
                  ),
                ),
              ),
              Text(
                "Yeni Nesil Öğrenme Deneyimi!",
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              formWidget,
              const SizedBox(height: 50),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin ? "Hesabınız yok mu? Kayıt Ol" : "Zaten hesabım var, giriş Yap",
                        style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
