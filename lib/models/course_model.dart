// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String? id;
  String? date;
  String? imagePath;
  String? videoUrl;
  String? title;
  CourseModel({
    this.id,
    this.date,
    this.imagePath,
    this.videoUrl,
    this.title,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map["id"] ?? "",
      date: map["date"] ?? "",
      imagePath: map["imagePath"] ?? "",
      videoUrl: map["videoUrl"] ?? "",
      title: map["title"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "date": date,
      "imagePath": imagePath,
      "videoUrl": videoUrl,
      "title": title,
    };
  }
}
