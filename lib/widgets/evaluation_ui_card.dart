import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/screens/evaluation_screen.dart';

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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EvaluationScreen(),
                    ));
              },
              child: Text(
                "Başla",
                style: GoogleFonts.ptSans(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
