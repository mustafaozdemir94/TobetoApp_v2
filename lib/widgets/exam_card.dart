import 'package:flutter/material.dart';

class ExamCard extends StatefulWidget {
  const ExamCard({Key? key}) : super(key: key);

  @override
  _ExamCardState createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Herkes için\nKodlama 1D\nDeğerlendirme\nSınavı"),
              Icon(Icons.check_box),
            ],
          ),
          Text(
            "Herkes İçin Kodlama - 1D",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.timer_outlined),
            Text("45 Dakika"),
          ]),
        ],
      ),
    );
  }
}
