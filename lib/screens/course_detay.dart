// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/course/course_bloc.dart';
import 'package:tobetoappv2/api/blocs/course/course_event.dart';
import 'package:tobetoappv2/api/blocs/course/course_state.dart';
import 'package:tobetoappv2/data/course_dummy.dart';
import 'package:video_player/video_player.dart';

import 'package:tobetoappv2/models/course_model.dart';
import 'package:tobetoappv2/screens/home_screen.dart';
import 'package:tobetoappv2/widgets/video_player_widget.dart';

class CourseDetay extends StatefulWidget {
  final CourseModel? video;
  const CourseDetay({
    Key? key,
    this.video,
  }) : super(key: key);

  @override
  _CourseDetayState createState() => _CourseDetayState();
}

class _CourseDetayState extends State<CourseDetay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/666.png'),
                ),
              ),
            ),
            backgroundColor: Colors.blueGrey,
            elevation: 22,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(75), child: SizedBox()),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          body: BlocBuilder<CourseBloc, CourseState>(builder: (context, state) {
            if (state is CourseInitial) {
              context.read<CourseBloc>().add(FetchCourse());
            }
            if (state is CourseLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CourseLoaded) {
              final List<CourseModel> course = state.courses;
              final args =
                  ModalRoute.of(context)!.settings.arguments as String?;
              // int? index;
              if (args != null) {
                course.indexWhere((element) => element.title == args);
              }
              final video = state.courses;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      height: 350,
                      child: SizedBox(
                        height: 250,
                        child: ListView.builder(
                          shrinkWrap: true,

                          itemCount: state.courses.length,

                          itemBuilder: (context, index) {
                            return CustomVideoPlayer(
                                videoLink: video[index].videoUrl!);
                          },
                          scrollDirection: Axis.vertical, // Yatay sıralama için
                        ),
                      ),
                    ),
                    const Text("Video İsmi"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                      },
                      child: const Text("Anasayfaya dön"),
                    ),
                  ],
                ),
              );
            }
            return Container();
          })),
    );
  }
}
