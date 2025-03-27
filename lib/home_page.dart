import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'user_data.dart';
import 'calendar_widget.dart'; // Calendar widget file
import 'timeline_widget.dart'; // Timeline widget file

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userName = UserData.name ?? 'User';
    return Scaffold(
      appBar: AppBar(title: Text('Hi, Good morning $userName')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'App Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Gap between AppBar and CalendarWidget.
            SizedBox(height: 20),
            CalendarWidget(),

            // Gap between CalendarWidget and header text.
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your class schedule for today",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Gap between header text and timeline widget.
            SizedBox(height: 40),
            TodayScheduleTimeline(),
          ],
        ),
      ),
    );
  }
}
