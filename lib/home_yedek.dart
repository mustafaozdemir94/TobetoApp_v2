/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tobetoappclone/widgets/app_bar_widget.dart';
import 'package:tobetoappclone/widgets/applications_card.dart';
import 'package:tobetoappclone/widgets/exam_card.dart';
import 'package:tobetoappclone/widgets/notice_card.dart';
import 'package:tobetoappclone/widgets/survey_card.dart';
import 'package:tobetoappclone/widgets/trainings_card.dart';
import 'package:tobetoappclone/widgets/trainings_card_2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: appBar(),
        ),
        drawer: const Drawer(child: Text("data")),
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
                        ApplicationsCard(),
                        ApplicationsCard(),
                      ],
                    ),
                    ListView(
                      scrollDirection: Axis.horizontal, // Yatay sıralama için
                      children: const [
                        TrainingsCard(),
                        TrainingsCard2(),
                      ],
                    ),
                    ListView(
                      scrollDirection: Axis.horizontal, // Yatay sıralama için
                      children: const [
                        NoticeCard(),
                        NoticeCard(),
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
                        ExamCard(),
                        ExamCard(),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey,
                    width: double.infinity,
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ExamCard(),
                        ExamCard(),
                        ExamCard(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.blueGrey,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Colors.blueGrey,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.all(16),
              gap: 10,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Ana Sayfa",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: "Favoriler",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Arama",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Ayarlar",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/