import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobetoappv2/models/course_model.dart';

class CourseRepository {
  Future<List<CourseModel>> fetchCourses() async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection("course");
    QuerySnapshot snapshot = await collectionRef.get();
    return snapshot.docs.map((doc) => CourseModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }
}
