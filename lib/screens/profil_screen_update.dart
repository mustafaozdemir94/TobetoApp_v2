import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/models/usermodel.dart';
import 'package:tobetoappv2/widgets/app_bar_widget_inside.dart';

class ProfilScreenUpdate extends StatefulWidget {
  const ProfilScreenUpdate({Key? key}) : super(key: key);

  @override
  _ProfilScreenUpdateState createState() => _ProfilScreenUpdateState();
}

class _ProfilScreenUpdateState extends State<ProfilScreenUpdate> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _biographyController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedPhoto;

  //
  Future pickImage() async {
    //yolu belirtme
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    // xfile file dönüştürme
    setState(() {
      if (image != null) {
        _selectedPhoto = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarWidgetInside(),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileInitial) {
            context.read<ProfileBloc>().add(FetchProfile());
          }
          if (state is ProfileLoaded) {
            UserModel user = state.user;
            _nameController.text = user.name ?? "";
            _surNameController.text = user.surname ?? "";
            _phoneController.text = user.phone ?? "";
            _emailController.text = user.email ?? "";
            _biographyController.text = user.biography ?? "";

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            _selectedPhoto != null
                                ? CircleAvatar(radius: 70, backgroundImage: FileImage(_selectedPhoto!))
                                : user.profilephoto != null
                                    ? CircleAvatar(radius: 70, backgroundImage: NetworkImage(user.profilephoto!))
                                    : const CircleAvatar(
                                        radius: 70,
                                        backgroundImage: AssetImage('assets/profile/person_add_img.png'),
                                      ),
                            TextButton(
                                onPressed: () {
                                  pickImage();
                                },
                                child: Text(
                                  "Resim Seçmek İçin Tıklayınız",
                                  style: GoogleFonts.ptSans(
                                    textStyle:
                                        const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                )),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: const Icon(Icons.person),
                                label: const Text("Ad"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _surNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: const Icon(Icons.person_add_alt_1_rounded),
                                label: const Text("Soyad"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: const Icon(Icons.phone),
                                label: const Text("Telefon"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: const Icon(Icons.email),
                                label: const Text("E Posta"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _biographyController,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Kısaca kendinizden bahsedin..",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: const Icon(Icons.person_add_sharp),
                                label: const Text("Hakkımda"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                var profileBloc = context.read<ProfileBloc>();
                                UserModel user = UserModel(
                                  name: _nameController.text,
                                  surname: _surNameController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text,
                                  biography: _biographyController.text,
                                );
                                profileBloc.add(
                                  UpdateProfileEvent(userModel: user, photo: _selectedPhoto),
                                );
                                Navigator.pop(context);
                              },
                              child: const Text("Değişiklikleri Kaydet"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
