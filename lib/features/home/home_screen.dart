import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_client_app/data/yoga_class.dart';
import 'package:yoga_client_app/features/search/search_screen.dart';

import '../course_detail/course_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<YogaClass> list = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getCourses();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
              iconSize: 25.5,
            ),
          )
        ],
        title: const Text('Yoga App'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.03, vertical: deviceWidth * 0.02),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = list[index];
                  return CourseInfo(
                    yogaClass: data,
                  );
                },
              ),
      ),
    );
  }

  void getCourses() async {
    setState(() {
      isLoading = true;
      list = [];
    });
    final yogaCourses =
        await FirebaseFirestore.instance.collection('yoga_courses').get();
    print(yogaCourses.docs[0].data());
    setState(() {
      isLoading = false;
      list = yogaCourses.docs.map((e) => YogaClass.fromMap(e.data())).toList();
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
