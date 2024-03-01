import 'package:tobetoappv2/models/course_model.dart';

List videoLink = [
  "https://cdn.cms.medianova.com/p/132/sp/13200/serveFlavor/entryId/0_402pg2wr/v/2/ev/10/flavorId/0_jpibng14/forceproxy/true/name/a.mp4",
  "https://cdn.cms.medianova.com/p/132/sp/13200/serveFlavor/entryId/0_1d1xnbrn/v/2/ev/10/flavorId/0_ccav4sj4/forceproxy/true/name/a.mp4",
  "https://cdn.cms.medianova.com/p/132/sp/13200/serveFlavor/entryId/0_yiu6meor/v/2/ev/10/flavorId/0_t84jbjzz/forceproxy/true/name/a.mp4"
];

List<CourseModel> courseList = <CourseModel>[
  CourseModel(
    id: "0",
    date: "21 Eylül",
    title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
    imagePath: "assets/education_img/ecmel_ayran.jpg",
    videoUrl: videoLink[1],
  ),
  CourseModel(
    id: "1",
    date: "21 Eylül",
    title: "Eğitimlere Nasıl Katılırım?",
    imagePath: "assets/education_img/istanbul_kod.png",
    videoUrl: videoLink[1],
  ),
  CourseModel(
    id: "2",
    date: "21 Eylül",
    title: "Herkes İçin Kodlama - 2B",
    imagePath: "assets/education_img/kodlama.jpg",
    videoUrl: videoLink[2],
  ),
];
