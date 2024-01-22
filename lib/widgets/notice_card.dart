import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticeCard extends StatefulWidget {
  const NoticeCard({Key? key}) : super(key: key);

  @override
  _NoticeCardState createState() => _NoticeCardState();
}

class _NoticeCardState extends State<NoticeCard> {
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
        border: const Border(
          left: BorderSide(
            color: Color(0xFF076B34), // Sol köşe rengi
            width: 10,
          ),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Duyuru",
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "İstanbul Kodluyor",
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Ocak Ayı Tercih Formu Bilgilendirmesi",
            style: GoogleFonts.ptSans(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.calendar_month_outlined),
                  const SizedBox(width: 5),
                  Text(
                    "12.01.2024",
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Text(
                    "Devamını Oku =>",
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
