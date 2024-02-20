import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluationUiCard extends StatefulWidget {
  const EvaluationUiCard({Key? key}) : super(key: key);

  @override
  _EvaluationUiCardState createState() => _EvaluationUiCardState();
}

class _EvaluationUiCardState extends State<EvaluationUiCard> {
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
            "   Kendini\nDeğerlendir",
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
