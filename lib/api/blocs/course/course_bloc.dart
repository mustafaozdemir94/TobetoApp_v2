// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobetoappv2/api/blocs/course/course_event.dart';
import 'package:tobetoappv2/api/blocs/course/course_state.dart';
import 'package:tobetoappv2/api/repository/course_repository.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;
  CourseBloc({
    required this.courseRepository,
  }) : super(CourseInitial()) {
    on<FetchCourse>(_onFetchCourse);
  }
  void _onFetchCourse(FetchCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
  }
}
