import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_event.dart';
import 'package:tobetoappv2/api/blocs/course_detail/course_detail_state.dart';
import 'package:tobetoappv2/api/repository/course_repository.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  final CourseRepository courseRepository;
  CourseDetailBloc({required this.courseRepository}) : super(CourseDetailInitial()) {
    on<FetchCourseDetailEvent>(_onFetchCourseDetail);
    on<ResetFetchDetailEvent>(_onReset);
  }
  void _onFetchCourseDetail(FetchCourseDetailEvent event, Emitter<CourseDetailState> emit) async {
    emit(CourseDetailLoading());
    try {
      final courseList = await courseRepository.fetchCourseById(event.id);
      emit(CourseDetailLoaded(course: courseList));
    } catch (e) {
      emit(CourseDetailError(
        message: e.toString(),
      ));
    }
  }

  void _onReset(ResetFetchDetailEvent event, Emitter<CourseDetailState> emit) async {
    emit(CourseDetailInitial());
  }
}
