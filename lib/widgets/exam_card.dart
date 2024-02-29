import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showExamDialog(context);
      },
      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Herkes için\nKodlama 1D\nDeğerlendirme\nSınavı"),
                Icon(Icons.check_box),
              ],
            ),
            Text(
              "Herkes İçin Kodlama - 1D",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.timer_outlined),
              Text("45 Dakika"),
            ]),
          ],
        ),
      ),
    );
  }

  void _showExamDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Herkes için Kodlama 1D Değerlendirme Sınavı"),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sevgili Adayımız,",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Herkes için Kodlama Eğitimi'ni tamamladığınız için tebrik ederiz. Bu eğitim sonrası bir sonraki aşamaya geçiş için 25 sorudan oluşan bir değerlendirme sınavımız bulunmaktadır.",
              ),
              SizedBox(height: 8),
              Text(
                "Bu test her kullanıcı için sadece 1 kez sunulmakta olup 45 dakika içinde tamamlanması gerekmektedir.",
              ),
              SizedBox(height: 8),
              Text(
                "Tüm değerlendirme kriterleri sonrası Mesleki Gelişim Eğitimlerine geçişiniz ile ilgili bilgilendirileceksiniz.",
              ),
              SizedBox(height: 8),
              Text(
                "Sevgiler,",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("TOBETO"),
              SizedBox(height: 8),
              Text(
                "Sınav Süresi : 45 Dakika\nSoru Sayısı : 25\nSoru Tipi : Çoktan Seçmeli",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}
