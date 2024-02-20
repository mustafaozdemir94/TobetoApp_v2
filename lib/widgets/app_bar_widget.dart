import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appBar extends StatelessWidget {
  const appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 60, 20),
        child: Image.asset('assets/666.png'),
      ),
      centerTitle: true,
      //backgroundColor: const Color(0xFFbb76fe),
      backgroundColor: Colors.blueGrey,
      bottom: const TabBar(
        labelStyle: TextStyle(color: Colors.white),
        isScrollable: false,
        labelColor: Colors.white,
        indicatorColor: Colors.white,
        dividerColor: Colors.white,
        tabs: [
          Tab(
            height: 120,
            text: "Başvurularım",
            icon: Icon(
              Icons.settings_applications,
            ),
          ),
          Tab(
            height: 120,
            text: "Eğitimlerim",
            icon: Icon(
              Icons.cast_for_education,
            ),
          ),
          Tab(
            iconMargin: EdgeInsets.fromLTRB(0, 15, 10, 5),
            height: 120,
            text: " Duyurular\nHaberlerim",
            icon: Icon(Icons.announcement_outlined),
          ),
          Tab(
            height: 120,
            text: "Anketlerim",
            icon: Icon(Icons.question_answer_outlined),
          )
        ],
        labelPadding: EdgeInsets.all(0),
      ),
    );
  }
}
