// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobetoappv2/models/course_model.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<CourseModel> courses;
  CourseLoaded({
    required this.courses,
  });
}

class CourseError extends CourseState {
  String errorMessage;
  CourseError({
    required this.errorMessage,
  });
}
