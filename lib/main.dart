import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoga_client_app/data/yoga_class.dart';
import 'package:yoga_client_app/firebase_options.dart';

import 'common/bottom_nav/bottom_nav_screen.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Client',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}

const yogaClassBoxName = 'yoga_class_box';
const bookList = 'course_booking';
const emailListBox = 'email_list_box';
//const user = 'user_box';

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(YogaClassAdapter());
  Hive.registerAdapter(CourseAdapter());
  await Hive.openBox<Course>(yogaClassBoxName);
  await Hive.openBox<Course>(bookList);
  await Hive.openBox<String>(emailListBox);
  // await Hive.openBox<Course>(user);
}
