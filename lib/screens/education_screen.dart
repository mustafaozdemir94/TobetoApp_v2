import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobetoappv2/api/blocs/course/course_bloc.dart';
import 'package:tobetoappv2/api/blocs/course/course_event.dart';
import 'package:tobetoappv2/api/blocs/course/course_state.dart';
import 'package:tobetoappv2/data/course_dummy.dart';
import 'package:tobetoappv2/widgets/app_bar_widget_inside.dart';
import 'package:tobetoappv2/widgets/trainings_card.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBarWidgetInside(),
        ),
        body: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseInitial) {
              context.read<CourseBloc>().add(FetchCourse());
            }
            if (state is CourseLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CourseLoaded) {
              final course = state.courses;
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        "Eğitimlerim",
                        style: GoogleFonts.ptSans(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.courses.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return TrainingsCard(course: course[index]);
                      },
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ));
  }
}
