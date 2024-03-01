import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Calendar(
                  weekDays: const [
                    "Pzt",
                    "Sal",
                    "Çar",
                    "Per",
                    "Cum",
                    "Cmt",
                    "Paz"
                  ],
                  todayColor: Colors.blue,
                  hideTodayIcon: true,
                  eventsList: Events().eventList,
                  locale: "tr_TR",
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const int generalShiftDay = 0;

class Events {
  final List<NeatCleanCalendarEvent> eventList = EvenetsData().baseList;
}

class EvenetsData {
  List tenWeeksLis = [];
  List<NeatCleanCalendarEvent> baseList = [
    NeatCleanCalendarEvent(
      "İş Analisti -1A",
      startTime: DateTime.utc(2024, 03, 1, 13),
      endTime: DateTime.utc(2024, 03, 1, 14),
    ),
    NeatCleanCalendarEvent(
      "Java & React Full Stack -1A",
      startTime: DateTime.utc(2024, 03, 1, 15),
      endTime: DateTime.utc(2024, 03, 1, 16),
    ),
    NeatCleanCalendarEvent(
      "Java & React Full Stack -1A",
      startTime: DateTime.utc(2024, 03, 1, 16),
      endTime: DateTime.utc(2024, 03, 1, 17),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1B",
      startTime: DateTime.utc(2024, 03, 2, 13),
      endTime: DateTime.utc(2024, 03, 2, 14),
    ),
    NeatCleanCalendarEvent(
      "Java & React Full Stack -1B",
      startTime: DateTime.utc(2024, 03, 2, 15),
      endTime: DateTime.utc(2024, 03, 2, 16),
    ),
    NeatCleanCalendarEvent(
      "Java & React Full Stack -1B",
      startTime: DateTime.utc(2024, 03, 5, 8),
      endTime: DateTime.utc(2024, 03, 5, 10),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1A",
      startTime: DateTime.utc(2024, 03, 7, 11),
      endTime: DateTime.utc(2024, 03, 7, 13),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1A",
      startTime: DateTime.utc(2024, 03, 8, 7),
      endTime: DateTime.utc(2024, 03, 8, 9),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1C",
      startTime: DateTime.utc(2024, 03, 8, 9),
      endTime: DateTime.utc(2024, 03, 8, 11),
    ),
    NeatCleanCalendarEvent(
      "Java & React Full Stack -1B",
      startTime: DateTime.utc(2024, 03, 8, 13),
      endTime: DateTime.utc(2024, 03, 8, 15),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1B",
      startTime: DateTime.utc(2024, 03, 8, 15),
      endTime: DateTime.utc(2024, 03, 8, 16),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1B",
      startTime: DateTime.utc(2024, 03, 15, 8),
      endTime: DateTime.utc(2024, 03, 15, 9),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1A",
      startTime: DateTime.utc(2024, 03, 15, 9),
      endTime: DateTime.utc(2024, 03, 15, 10),
    ),
    NeatCleanCalendarEvent(
      "Mobil Geliştirici (Flutter) -1A",
      startTime: DateTime.utc(2024, 03, 15, 10),
      endTime: DateTime.utc(2024, 03, 15, 13),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1C",
      startTime: DateTime.utc(2024, 03, 15, 13),
      endTime: DateTime.utc(2024, 03, 15, 14),
    ),
    NeatCleanCalendarEvent(
      "Java & React Full Stack -1A",
      startTime: DateTime.utc(2024, 03, 15, 15),
      endTime: DateTime.utc(2024, 03, 15, 16),
    ),
    NeatCleanCalendarEvent(
      "İş Analisti -1A",
      startTime: DateTime.utc(2024, 03, 15, 16),
      endTime: DateTime.utc(2024, 03, 15, 17),
    ),
    NeatCleanCalendarEvent(
      "Mobil Geliştirici (Flutter) -1A",
      startTime: DateTime.utc(2024, 03, 16, 13),
      endTime: DateTime.utc(2024, 03, 16, 14),
    ),
    NeatCleanCalendarEvent(
      ".NET & React Full Stack -1C",
      startTime: DateTime.utc(2024, 03, 16, 15),
      endTime: DateTime.utc(2024, 03, 16, 17),
    ),
    NeatCleanCalendarEvent(
      "Yazılım Kalite ve Test Uzmanı -1A",
      startTime: DateTime.utc(2024, 03, 18, 8),
      endTime: DateTime.utc(2024, 03, 18, 12),
    ),
    NeatCleanCalendarEvent(
      "Yazılım Kalite ve Test Uzmanı -1A",
      startTime: DateTime.utc(2024, 03, 19, 13),
      endTime: DateTime.utc(2024, 03, 19, 16),
    ),
    NeatCleanCalendarEvent(
      "Mobil Geliştirici (Flutter) -1B",
      startTime: DateTime.utc(2024, 03, 20, 13),
      endTime: DateTime.utc(2024, 03, 20, 18),
    ),
    NeatCleanCalendarEvent(
      "Mobil Geliştirici (Flutter) -1B",
      startTime: DateTime.utc(2024, 03, 21, 8),
      endTime: DateTime.utc(2024, 03, 21, 16),
    ),
  ];
}
