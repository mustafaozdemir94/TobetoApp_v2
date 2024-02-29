// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobetoappv2/models/course_model.dart';

abstract class CourseDetailState {}

class CourseDetailInitial extends CourseDetailState {}

class CourseDetailLoading extends CourseDetailState {}

class CourseDetailLoaded extends CourseDetailState {
  final CourseModel course;
  CourseDetailLoaded({
    required this.course,
  });
}

class CourseDetailError extends CourseDetailState {
  final String message;
  CourseDetailError({
    required this.message,
  });
}
