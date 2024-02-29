import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/models/usermodel.dart';
import 'package:tobetoappv2/screens/profil_screen_update.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/666.png'),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 22,
        bottom: const PreferredSize(preferredSize: Size.fromHeight(75), child: SizedBox()),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
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

            return SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: NetworkImage("${user.profilephoto}"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user.name}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${user.surname}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${user.email}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${user.phone}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilScreenUpdate(),
                              ));
                        },
                        child: const Text("Profil Düzenle"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is ProfileError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Center(
            child: Container(),
          );
        },
      ),
    );
  }
}
