import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_bloc.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_event.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_state.dart';
import 'package:tobetoappv2/screens/home_screen.dart';
import 'package:tobetoappv2/widgets/app_bar_widget_inside.dart';
import 'package:video_player/video_player.dart';

class CourseDetay extends StatefulWidget {
  const CourseDetay({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _CourseDetayState createState() => _CourseDetayState();
}

class _CourseDetayState extends State<CourseDetay> {
  late FlickManager flickManager;
  Uri? videoUri;

  @override
  void initState() {
    super.initState();
    context.read<CourseDetailBloc>().add(ResetFetchDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarWidgetInside(),
      ),
      body: BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) {
          if (state is CourseDetailInitial) {
            context.read<CourseDetailBloc>().add(FetchCourseDetailEvent(id: widget.id));
            return const Center(
              child: Text("İstek Atılıyor"),
            );
          }
          if (state is CourseDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CourseDetailLoaded) {
            if (state.course.videoUrl != null) {
              videoUri = Uri.parse(state.course.videoUrl!);
              flickManager = FlickManager(videoPlayerController: VideoPlayerController.networkUrl(videoUri!));
            }
            return Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      state.course.title!,
                      style: GoogleFonts.ptSans(textStyle: const TextStyle(fontSize: 25)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 3,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(height: 10),
                  if (videoUri != null) FlickVideoPlayer(flickManager: flickManager),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined),
                      Text(state.course.date!),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: const Text("Anasayfaya Dön"),
                  ),
                ],
              ),
            );
          }
          if (state is CourseDetailError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text("Bilinmedik Durum"),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}
