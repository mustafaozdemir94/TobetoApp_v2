import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tobetoappv2/api/blocs/course/course_bloc.dart';
import 'package:tobetoappv2/api/blocs/course/course_event.dart';
import 'package:tobetoappv2/api/blocs/course/course_state.dart';
import 'package:tobetoappv2/constants/collection_names.dart';
import 'package:tobetoappv2/data/course_dummy.dart';
import 'package:tobetoappv2/screens/evaluation_screen.dart';
import 'package:tobetoappv2/widgets/app_bar_widget.dart';
import 'package:tobetoappv2/widgets/applications_card.dart';
import 'package:tobetoappv2/widgets/drawer.dart';
import 'package:tobetoappv2/widgets/evaluation_ui_card.dart';
import 'package:tobetoappv2/widgets/exam_card.dart';
import 'package:tobetoappv2/widgets/notice_card.dart';
import 'package:tobetoappv2/widgets/notice_card2.dart';
import 'package:tobetoappv2/widgets/profil_ui_card.dart';
import 'package:tobetoappv2/widgets/startlearning_ui_card.dart';
import 'package:tobetoappv2/widgets/survey_card.dart';
import 'package:tobetoappv2/widgets/trainings_card.dart';
import 'package:tobetoappv2/widgets/trainings_card_2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final courseCollection = firebaseFirestore.collection(Collections.course);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const drawerItem(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: appBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: TabBarView(
                  physics: const PageScrollPhysics(), // Yatay kaydırma için physics özelliği
                  children: [
                    ListView(
                      scrollDirection: Axis.horizontal, // Yatay sıralama için
                      children: const [
                        ApplicationsCard(),
                      ],
                    ),
                    BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                        if (state is CourseInitial) {
                          context.read<CourseBloc>().add(FetchCourse());
                        }
                        if (state is CourseLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (state is CourseLoaded) {
                          final course = state.courses;

                          return ListView.builder(
                            itemCount: state.courses.length,

                            itemBuilder: (context, index) {
                              return TrainingsCard(course: course[index]);
                            },
                            scrollDirection: Axis.horizontal, // Yatay sıralama için
                          );
                        }
                        return Container();
                      },
                    ),
                    ListView(
                      scrollDirection: Axis.horizontal, // Yatay sıralama için
                      children: const [
                        NoticeCard(),
                        NoticeCard2(),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal, // Yatay sıralama için
                      children: const [
                        SurveyCard(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blueGrey,
                    width: double.infinity,
                    height: 30,
                    child: Center(
                      child: Text(
                        "Sınavlarım",
                        style: GoogleFonts.ptSans(
                          color: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ExamCard(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey,
                    width: double.infinity,
                    height: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ProfilUiCard(),
                        SizedBox(
                          width: 10,
                        ),
                        EvaluationUiCard(),
                        SizedBox(
                          width: 10,
                        ),
                        StartlearningUiCard(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Colors.blueGrey,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: const EdgeInsets.all(16),
              gap: 10,
              tabs: [
                GButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  icon: Icons.home,
                  text: "Ana Sayfa",
                ),
                GButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EvaluationScreen(),
                        ));
                  },
                  icon: Icons.checklist,
                  text: "Değerlendirmeler",
                ),
                const GButton(
                  icon: Icons.list,
                  text: "Katalog",
                ),
                const GButton(
                  icon: Icons.calendar_month_outlined,
                  text: "Takvim",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
