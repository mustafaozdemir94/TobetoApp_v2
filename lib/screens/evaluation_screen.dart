import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  _EvaluationScreenState createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
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
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              "Yetkinliklerini ücretsiz ölç,\n bilgilerini test et.",
              style: TextStyle(
                color: Color.fromARGB(255, 112, 112, 112),
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView(children: const <Widget>[
              SuccesModelCard(),
              SuccesTestCard(),
              DeveloperTestCard(),
            ]),
          ),
        ],
      ),
    );
  }
}

class SuccesModelCard extends StatelessWidget {
  const SuccesModelCard({
    super.key,
  });

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
              Color.fromRGBO(223, 162, 251, 1),
              Color.fromRGBO(60, 11, 140, 1),
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
              const Text(
                'Tobeto İşte Başarı Modeli',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 28, 10, 28),
                child: Text(
                  textAlign: TextAlign.center,
                  '80 soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan.',
                  style: TextStyle(
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
                  onPressed: () {},
                  child: Text("Başla")),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccesTestCard extends StatelessWidget {
  const SuccesTestCard({
    super.key,
  });

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
              const Text(
                'Yazılımda Başarı Testi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 28, 10, 28),
                child: Text(
                  textAlign: TextAlign.center,
                  'Çoktan seçmeli sorular ile teknik bilgini test et',
                  style: TextStyle(
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
                  onPressed: () {},
                  child: Text("Başla")),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperTestCard extends StatelessWidget {
  const DeveloperTestCard({
    super.key,
  });

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
              const Expanded(
                child: Text(
                  'Frond End',
                  style: TextStyle(
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
                    onPressed: _launchUrl,
                    child: Text("Başla")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://www.linkedin.com/in/muhammedkemal/');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
