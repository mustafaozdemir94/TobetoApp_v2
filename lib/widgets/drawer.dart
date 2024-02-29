import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/models/usermodel.dart';
import 'package:tobetoappv2/screens/education_screen.dart';
import 'package:tobetoappv2/screens/evaluation_screen.dart';
import 'package:tobetoappv2/screens/home_screen.dart';
import 'package:tobetoappv2/screens/profil_screen.dart';

class drawerItem extends StatelessWidget {
  const drawerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blueGrey[100],
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial || state is ProfileUpdated) {
              context.read<ProfileBloc>().add(FetchProfile());
            }
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              UserModel user = state.user;
              String url = user.profilephoto!;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    color: Colors.blueGrey,
                    padding: EdgeInsets.only(
                      top: 24 + MediaQuery.of(context).padding.top,
                      bottom: 24,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilScreen(),
                            ));
                      },
                      child: Column(
                        children: [
                          user.profilephoto == ""
                              ? const CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  radius: 70,
                                  backgroundImage: AssetImage('assets/person_add_img.png'),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  radius: 70,
                                  backgroundImage: NetworkImage(user.profilephoto!),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${user.name!} ${user.surname!}',
                            style: GoogleFonts.ptSans(
                                color: Colors.white, textStyle: Theme.of(context).textTheme.headlineMedium),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            user.email!,
                            style: GoogleFonts.ptSans(
                                color: Colors.white, textStyle: Theme.of(context).textTheme.labelLarge),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    title: Text(
                      "Ana Sayfa",
                      style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                    leading: const Icon(Icons.home),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EvaluationScreen(),
                          ));
                    },
                    title: Text(
                      "Değerlendirmeler",
                      style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                    leading: const Icon(Icons.checklist),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilScreen(),
                          ));
                    },
                    title: Text(
                      "Profilim",
                      style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                    leading: const Icon(Icons.account_box),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EducationScreen(),
                          ));
                    },
                    title: Text(
                      "Katalog",
                      style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                    leading: const Icon(Icons.list),
                  ),
                  ListTile(
                    title: Text(
                      "Takvim",
                      style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                    leading: const Icon(Icons.calendar_month_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    title: Text(
                      "Sistemden Çıkış",
                      style: GoogleFonts.ptSans(
                        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                    leading: const Icon(Icons.exit_to_app),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.copyright_rounded),
                      const SizedBox(width: 5),
                      Text(
                        "2024 Tobeto",
                        style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            if (state is ProfileError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          },
        ));
  }
}
