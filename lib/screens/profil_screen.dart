import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/models/usermodel.dart';
import 'package:tobetoappv2/screens/profil_screen_update.dart';
import 'package:tobetoappv2/widgets/app_bar_widget_inside.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarWidgetInside(),
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
              child: Card(
                elevation: 1,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    user.profilephoto == ""
                        ? const CircleAvatar(radius: 70, backgroundImage: AssetImage("assets/person_add_img.png"))
                        : CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(user.profilephoto!),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${user.name!} ${user.surname!}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const Icon(Icons.phone),
                        Text(
                          "${user.phone}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const Icon(Icons.email),
                        Text(
                          "${user.email}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 15,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "${user.biography}",
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10, // Yükseklik sınırlaması ekleyebilirsiniz
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18),
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilScreenUpdate(),
                            ));
                      },
                      child: const Text("Profil Düzenle"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ));
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
