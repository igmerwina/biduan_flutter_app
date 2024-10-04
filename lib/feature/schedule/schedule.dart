import 'package:doctor_booking_app/utils/colors_custom.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  // Dummy list of schedules
  final List<Schedule> schedules = [
    Schedule(
        day: 'Jum\at',
        date: '2024-10-04',
        time: '10:00',
        activity: 'Dangdut Pegadaian'),
    Schedule(
        day: 'Jum\at',
        date: '2024-10-04',
        time: '12:00',
        activity: 'Goyang BUMN'),
    Schedule(
        day: 'Jum\at',
        date: '2024-10-04',
        time: '15:00',
        activity: 'Slametetan sunatan'),
    Schedule(
        day: 'Jum\at', date: '2024-10-04', time: '03:00', activity: 'SPA++'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Biduan'),
      ),
      body: ListView.builder(
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.event, color: ColorsCustom.googleBg),
              title: Text('${schedule.activity}'),
              subtitle:
                  Text('${schedule.day}, ${schedule.date} | ${schedule.time}'),
              trailing: Icon(
                Icons.audiotrack,
                color: ColorsCustom.googleBg,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model class for Schedule
class Schedule {
  final String day;
  final String date;
  final String time;
  final String activity;

  Schedule(
      {required this.day,
      required this.date,
      required this.time,
      required this.activity});
}
