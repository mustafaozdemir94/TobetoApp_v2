import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/screens/profil_screen.dart';

class drawerItem extends StatelessWidget {
  const drawerItem({
    super.key,
  });

  Future<String?> getUsername(String uid) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        // Belge varsa, kullanıcının "username" değerini al
        return userSnapshot['username'];
      } else {
        print('Belge bulunamadı');
        return null;
      }
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return FutureBuilder(
      future: getUsername(user?.uid ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Veri yüklenene kadar bekleme durumu
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Hata durumu
          return Text('Hata: ${snapshot.error}');
        } else {
          // Veri başarıyla yüklendi
          String? username = snapshot.data;
          String? email = user?.email;

          return Drawer(
            backgroundColor: Colors.blueGrey[100],
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(username ?? ""),
                  accountEmail: Text(email ?? ""),
                  currentAccountPicture: const ClipOval(
                    child: Image(
                      image: AssetImage('assets/drawerIcon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bggg.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Ana Sayfa",
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                    ),
                  ),
                  leading: const Icon(Icons.home),
                ),
                ListTile(
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
            ),
          );
        }
      },
    );
  }
}
