import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  _EvaluationScreenState createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  List<Specialty> specialtyList = [
    Specialty('Front End', ""),
    Specialty('Full Stack', ""),
    Specialty('Back End', ""),
    Specialty('Microsoft SQL Server', ""),
    Specialty('Masaüstü Programlama', ""),
  ];
  List<Detail> cardDetail = [
    Detail("Tobeto İşte Başarı Modeli",
        "80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan."),
    Detail("Yazılımda Başarı Testi",
        "Çoktan seçmeli sorular ile teknik bilgini test et.")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/666.png'),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 22,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(75), child: SizedBox()),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Yetkinliklerini ücretsiz ölç,\n bilgilerini test et.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 112, 112),
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cardDetail.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SuccesTestCard(
                        name: cardDetail[index].name,
                        content: cardDetail[index].content,
                      );
                    },
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: specialtyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DeveloperTestCard(
                        name: specialtyList[index].name,
                        link: specialtyList[index].link,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Detail {
  String name;
  String content;

  Detail(this.name, this.content);
}

class SuccesTestCard extends StatelessWidget {
  final String name;
  final String content;
  const SuccesTestCard({super.key, required this.name, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(183, 160, 250, 1),
              Color.fromRGBO(29, 11, 140, 1),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 28, 10, 28),
                child: Text(
                  textAlign: TextAlign.center,
                  content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _launchUrl();
                  },
                  child: const Text("Başla")),
            ],
          ),
        ),
      ),
    );
  }
}

class Specialty {
  String name;
  String link;

  Specialty(this.name, this.link);
}

class DeveloperTestCard extends StatelessWidget {
  final String name;
  final String link;

  const DeveloperTestCard({required this.name, required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(183, 160, 250, 1),
              Color.fromRGBO(29, 11, 140, 1),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.text_snippet,
                  color: Color.fromARGB(255, 95, 95, 95),
                  size: 40,
                ),
              ),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (link != null) {
                        _launchUrl();
                      } else {
                        print('Bu öğe için link bulunmamaktadır.');
                      }
                    },
                    child: const Text("Başla")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://tobeto.com/degerlendirmeler');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}


// class Specialty {
//   String name;
//   String link;

//   Specialty(this.name, this.link);
// }

// class DeveloperTestCard extends StatelessWidget {
//   final String name;
//   final String link;

//   DeveloperTestCard({required this.name, required this.link});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         height: 100,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             colors: [
//               Color.fromRGBO(183, 160, 250, 1),
//               Color.fromRGBO(29, 11, 140, 1),
//             ],
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//         ),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Icon(
//                   Icons.text_snippet,
//                   color: Color.fromARGB(255, 95, 95, 95),
//                   size: 40,
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                     ),
//                     onPressed: () {
//                       if (link != null) {
//                         _launchUrl();
//                       } else {
//                         print('Bu öğe için link bulunmamaktadır.');
//                       }
//                     },
//                     child: Text("Başla")),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// class SuccesModelCard extends StatelessWidget {
//   const SuccesModelCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Container(
//         height: 300,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             colors: [
//               Color.fromRGBO(223, 162, 251, 1),
//               Color.fromRGBO(60, 11, 140, 1),
//             ],
//           ),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(0),
//             topRight: Radius.circular(16),
//             bottomRight: Radius.circular(16),
//             bottomLeft: Radius.circular(16),
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Tobeto İşte Başarı Modeli',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(10, 28, 10, 28),
//                 child: Text(
//                   textAlign: TextAlign.center,
//                   '80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan.',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                   ),
//                   onPressed: () {},
//                   child: Text("Başla")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }