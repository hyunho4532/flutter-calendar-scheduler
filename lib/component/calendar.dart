import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar ({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar (
        focusedDay: DateTime.now(),
        firstDay: DateTime(1800),
        lastDay: DateTime(3000),

      headerStyle: const HeaderStyle (
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle (
          fontWeight: FontWeight.w800,
          fontSize: 16.0,
        ),
      ),

      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {

          print(selectedDay);

          setState(() {
            this.selectedDay = selectedDay;
          });
      },

      selectedDayPredicate: (DateTime date) {

          if (selectedDay == null) {
            return false;
          }

          return date.year == selectedDay.year &&
                  date.month == selectedDay.month &&
                  date.day == selectedDay.day;
      },
    );
  }
}
