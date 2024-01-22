import 'package:flutter/material.dart';

class ApplicationsCard extends StatefulWidget {
  const ApplicationsCard({Key? key}) : super(key: key);

  @override
  _ApplicationsCardState createState() => _ApplicationsCardState();
}

class _ApplicationsCardState extends State<ApplicationsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 180,
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
            color: Color(0xFF076B34),
            width: 10,
          ),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "İstanbul Kodluyor\nBilgilendirme",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.38,
                  decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Kabul Edildi",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: <Widget>[
              Icon(
                Icons.done,
                color: Color(0xFF076B34),
              ),
              Text("İstanbul Kodluyor Başvuru Formu \nOnaylandı."),
            ],
          ),
          const Row(
            children: <Widget>[
              Icon(
                Icons.done,
                color: Color(0xFF076B34),
              ),
              Text("İstanbul Kodluyor Belge Yükleme \nFormu Onaylandı."),
            ],
          ),
        ],
      ),
    );
  }
}
