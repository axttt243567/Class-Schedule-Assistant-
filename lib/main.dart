import 'package:flutter/material.dart';
import 'splash_screen1.dart';
import 'home_page.dart';
import 'user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      debugShowCheckedModeBanner: false,
      home: UserData.isFirstTime ? const SplashScreen1() : HomePage(),
    );
  }
}
