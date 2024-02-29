import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_bloc.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_event.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_state.dart';

class CourseDetay extends StatefulWidget {
  const CourseDetay({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _CourseDetayState createState() => _CourseDetayState();
}

class _CourseDetayState extends State<CourseDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Course Detay"),
        ),
        body: BlocBuilder<CourseDetailBloc, CourseDetailState>(
          builder: (context, state) {
            if (state is CourseDetailInitial) {
              print("initial");
              context.read<CourseDetailBloc>().add(FetchCourseDetailEvent(id: widget.id));
              return const Center(
                child: Text("İstek Atılıyor"),
              );
            }
            if (state is CourseDetailLoading) {
              print("loading");
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CourseDetailLoaded) {
              print("loaded");
              return Center(
                child: Text(state.course.title!),
              );
            }
            if (state is CourseDetailError) {
              print("loaded");
              return Center(
                child: Text(state.message),
              );
            }
            return const Center(
              child: Text("Bilinmedik Durum"),
            );
          },
        ));
  }
}
