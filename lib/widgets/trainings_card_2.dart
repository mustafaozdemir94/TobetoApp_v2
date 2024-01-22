// Bu card sadece çeşitlilik olması için tasarlandı proje de kullanılmayacak.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingsCard2 extends StatefulWidget {
  const TrainingsCard2({Key? key}) : super(key: key);

  @override
  _TrainingsCard2State createState() => _TrainingsCard2State();
}

class _TrainingsCard2State extends State<TrainingsCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        /* border: const Border(
          left: BorderSide(
            color: Colors.white, // Sol köşe rengi       // Bu tasarımda ihtiyaç yok
            width: 10,
          ),
        ), */
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/mentor_img.jpg"),
              ),
            ),
          ),
          Text(
            "Mentör Buluşmaları",
            style: GoogleFonts.ptSans(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "16 Ekim 2023 03:00",
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Text(
                    "Eğitime Git =>",
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
