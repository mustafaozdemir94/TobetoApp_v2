// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CourseDetailEvent {}

class FetchCourseDetailEvent extends CourseDetailEvent {
  final String id;
  FetchCourseDetailEvent({
    required this.id,
  });
}

class ResetFetchDetailEvent extends CourseDetailEvent {}
