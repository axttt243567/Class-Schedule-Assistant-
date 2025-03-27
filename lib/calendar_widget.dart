import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  // Returns a list of dates for the current week starting with Sunday.
  List<DateTime> getCurrentWeekDates() {
    final now = DateTime.now();
    // Calculate offset: in Dart, Monday = 1 and Sunday = 7.
    final int offset = now.weekday % 7;
    final sunday = now.subtract(Duration(days: offset));
    return List.generate(
      7,
      (index) => DateTime(sunday.year, sunday.month, sunday.day + index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates();
    final now = DateTime.now();
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:
            weekDates.map((date) {
              bool isToday =
                  date.year == now.year &&
                  date.month == now.month &&
                  date.day == now.day;
              final day = intl.DateFormat(
                'EEE',
              ).format(date); // e.g., Sun, Mon, ...
              final dateString = intl.DateFormat('d').format(date);
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration:
                      isToday
                          ? BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          )
                          : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isToday ? Colors.blue : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        dateString,
                        style: TextStyle(
                          fontSize: 18,
                          color: isToday ? Colors.blue : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
