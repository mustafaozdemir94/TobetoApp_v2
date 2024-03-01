import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tobetoappv2/models/course_model.dart';
import 'package:tobetoappv2/screens/course_detay.dart';

class TrainingsCard extends StatefulWidget {
  final CourseModel course;

  const TrainingsCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  _TrainingsCardState createState() => _TrainingsCardState();
}

class _TrainingsCardState extends State<TrainingsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 200,
      padding: const EdgeInsets.all(10),
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
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 110,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.course.imagePath!),
              ),
            ),
          ),
          Text(
            widget.course.title!,
            style: GoogleFonts.ptSans(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12, //15
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.course.date!,
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print(widget.course.id!);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => CourseDetay(id: widget.course.id!)));
                },
                child: Container(
                  child: Text(
                    "Eğitime Git =>",
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
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
