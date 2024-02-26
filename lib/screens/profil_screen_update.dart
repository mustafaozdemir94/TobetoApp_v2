import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_bloc.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_event.dart';
import 'package:tobetoappv2/api/blocs/profile/profile_state.dart';
import 'package:tobetoappv2/models/usermodel.dart';

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
      appBar: AppBar(),
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

            return SingleChildScrollView(
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: _selectedPhoto != null
                                  ? CircleAvatar(
                                      radius: 70,
                                      backgroundImage: FileImage(_selectedPhoto!),
                                    )
                                  : user.profilephoto != null
                                      ? Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(user.profilephoto!))),
                                        )
                                      : const CircleAvatar(
                                          radius: 70,
                                          backgroundImage: AssetImage('assets/e.jpg'),
                                        )),
                        ),
                        TextButton(
                            onPressed: () {
                              pickImage();
                            },
                            child: const Text("resim seç")),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text("Ad"),
                          ),
                        ),
                        TextFormField(
                          controller: _surNameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text("Soyad"),
                          ),
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text("Tel"),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text("E Posta"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            var profileBloc = context.read<ProfileBloc>();
                            UserModel user = UserModel(
                              name: _nameController.text,
                              surname: _surNameController.text,
                              phone: _phoneController.text,
                              email: _emailController.text,
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
            );
          }
          return Container();
        },
      ),
    );
  }
}
