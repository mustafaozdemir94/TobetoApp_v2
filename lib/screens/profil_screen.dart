import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
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
                      child: const Image(
                        image: AssetImage('assets/e.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mustafa Özdemir",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "mustafaozdemiroffical@gmail.com",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "+905326824809",
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
        ));
  }
}
