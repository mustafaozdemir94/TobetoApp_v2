import 'package:flutter/material.dart';

class ProfilScreenUpdate extends StatefulWidget {
  const ProfilScreenUpdate({Key? key}) : super(key: key);

  @override
  _ProfilScreenUpdateState createState() => _ProfilScreenUpdateState();
}

class _ProfilScreenUpdateState extends State<ProfilScreenUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/e.jpg'),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("Ad"),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("Soyad"),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("Tel"),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("E Posta"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Değişiklikleri Kaydet"),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
