import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobetoappv2/models/course_model.dart';

Future<List<CourseModel>> fetchCourses() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore.collection('course').get();
    for (var doc in querySnapshot.docs) {}
  } catch (e) {
    print(e);
  }
}
