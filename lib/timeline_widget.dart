import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TodayScheduleTimeline extends StatelessWidget {
  const TodayScheduleTimeline({Key? key}) : super(key: key);

  /// Schedule data for each day.
  final Map<String, List<Map<String, String>>> scheduleData = const {
    "Monday": [
      {"time": "09:00 AM – 10:00 AM", "subject": "MATH-II, CR14"},
      {"time": "10:00 AM – 11:00 AM", "subject": "ES, CR14"},
      {"time": "11:00 AM – 12:00 PM", "subject": "DS, CR14"},
      {"time": "12:00 PM – 01:00 PM", "subject": "BE, CR14"},
      {"time": "02:00 PM – 04:00 PM", "subject": "BE Lab., EL-I"},
    ],
    "Tuesday": [
      {"time": "09:00 AM – 10:00 AM", "subject": "ES, CR14"},
      {"time": "10:00 AM – 11:00 AM", "subject": "BE, CR14"},
      {"time": "11:00 AM – 12:00 PM", "subject": "PHY-II, CR14"},
      {"time": "02:00 PM – 04:00 PM", "subject": "BE Lab., EL-I"},
    ],
    "Wednesday": [
      {"time": "09:00 AM – 10:00 AM", "subject": "MATH-II, CR1"},
      {"time": "10:00 AM – 11:00 AM", "subject": "BE, CR1"},
      {"time": "11:00 AM – 01:00 PM", "subject": "Physics Lab."},
    ],
    "Thursday": [
      {"time": "09:00 AM – 10:00 AM", "subject": "ES, CR12"},
      {"time": "10:00 AM – 11:00 AM", "subject": "MATH-II, CR12"},
      {"time": "02:00 PM – 04:00 PM", "subject": "DSC Lab., PL1"},
    ],
    "Friday": [
      {"time": "09:00 AM – 10:00 AM", "subject": "MATH-II, CR11"},
      {"time": "10:00 AM – 11:00 AM", "subject": "BE, CR11"},
      {"time": "11:00 AM – 12:00 PM", "subject": "PHY-II, CR11"},
      {"time": "12:00 PM – 01:00 PM", "subject": "DS, CR11"},
      {"time": "02:00 PM – 04:00 PM", "subject": "EG Practices, PL1"},
    ],
    "Saturday": [
      {"time": "09:00 AM – 10:00 AM", "subject": "DS, CR14"},
      {"time": "10:00 AM – 11:00 AM", "subject": "PHY-II, CR14"},
      {"time": "02:00 PM – 04:00 PM", "subject": "Physics Lab."},
      {"time": "02:00 PM – 04:00 PM", "subject": "BE Lab., EL-I"},
    ],
    "Sunday": [],
  };

  @override
  Widget build(BuildContext context) {
    // Determine current day name, e.g., "Monday"
    final currentDay = intl.DateFormat('EEEE').format(DateTime.now());
    final todaysSchedule = scheduleData[currentDay] ?? [];

    if (todaysSchedule.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "No classes scheduled for today.",
          style: const TextStyle(fontSize: 16),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Removed header text.
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: todaysSchedule.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final item = todaysSchedule[index];
            final fullSubject = item['subject']!;
            final parts = fullSubject.split(',');
            final subjectName = parts[0].trim();
            final classroom = parts.length > 1 ? parts[1].trim() : '';

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display class time
                Container(
                  width: 140,
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    item['time']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Timeline indicator
                Column(
                  children: [
                    Container(width: 2, height: 10, color: Colors.grey),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(width: 2, height: 50, color: Colors.grey),
                  ],
                ),
                const SizedBox(width: 10),
                // Class details
                Expanded(
                  child: Row(
                    children: [
                      // Subject container
                      Container(
                        width: 150,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          subjectName,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Classroom container
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          classroom,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
