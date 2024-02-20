import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilUiCard extends StatefulWidget {
  const ProfilUiCard({Key? key}) : super(key: key);

  @override
  _ProfilUiCardState createState() => _ProfilUiCardState();
}

class _ProfilUiCardState extends State<ProfilUiCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Profilini\n Oluştur",
            style: GoogleFonts.ptSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Başla",
                style: GoogleFonts.ptSans(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
