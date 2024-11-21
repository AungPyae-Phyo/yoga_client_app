import 'package:flutter/material.dart';
import 'package:yoga_client_app/data/yoga_class.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<YogaClass> yogaClasses = []; // All yoga classes
  List<YogaClass> filteredYogaClasses = []; // Filtered yoga classes
  TextEditingController searchController = TextEditingController();
  String? selectedDay;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    getAllYogaClasses();
  }

  // Fetch all yoga classes from the database or manager
  void getAllYogaClasses() {
    setState(() {
      // Assuming this fetches all yoga classes
      filteredYogaClasses = yogaClasses;
    });
  }

  // Filter the yoga classes and courses based on the search criteria
  void filterCourses() {
    setState(() {
      filteredYogaClasses = yogaClasses.where((yogaClass) {
        final matchesDay =
            selectedDay == null || yogaClass.dayOfWeek == selectedDay;
        final matchesTime =
            selectedTime == null || _isTimeMatch(yogaClass.time ?? "");
        final matchesSearch = yogaClass.description
                ?.toLowerCase()
                .contains(searchController.text.toLowerCase()) ??
            false;

        // Filter within the classes of the yoga class
        final filteredClasses = yogaClass.classes?.where((course) {
          final matchesCourseDay =
              selectedDay == null || course.dayOfWeek == selectedDay;
          // final matchesCourseTime = selectedTime == null ||
          //     _isTimeMatch(course. ?? "");
          final matchesCourseSearch = course.comment
                  ?.toLowerCase()
                  .contains(searchController.text.toLowerCase()) ??
              false;
          return matchesCourseDay && matchesCourseSearch;
        }).toList();

        return (matchesDay || matchesTime || matchesSearch) &&
            (filteredClasses?.isNotEmpty ?? false);
      }).toList();
    });
  }

  // Helper function to check if the course time matches the selected time
  bool _isTimeMatch(String courseTime) {
    final selectedTimeString = selectedTime?.format(context);
    return courseTime == selectedTimeString;
  }

  // Show Date Picker for selecting a date
  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      filterCourses(); // Apply filtering after selecting the date
    }
  }

  // Show Time Picker for selecting time
  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
      filterCourses(); // Apply filtering after selecting the time
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Courses'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search by comment or course title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => filterCourses(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Day Dropdown
                Expanded(
                  child: DropdownButton<String>(
                    hint: const Text('Select Day'),
                    value: selectedDay,
                    onChanged: (newValue) {
                      setState(() {
                        selectedDay = newValue;
                      });
                      filterCourses();
                    },
                    items: [
                      'Monday',
                      'Tuesday',
                      'Wednesday',
                      'Thursday',
                      'Friday'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 10),
                // Time Picker Button
                IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => _selectTime(context),
                ),
                const SizedBox(width: 10),
                // Date Picker Button
                IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          filteredYogaClasses.isEmpty
              ? const Center(child: Text('No courses found'))
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredYogaClasses.length,
                    itemBuilder: (context, index) {
                      final yogaClass = filteredYogaClasses[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(yogaClass.description ?? 'No Title'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Day: ${yogaClass.dayOfWeek ?? 'N/A'}'),
                              Text('Type: ${yogaClass.typeOfClass ?? 'N/A'}'),
                              ...?yogaClass.classes?.map((course) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Course: ${course.comment ?? 'N/A'}'),
                                    Text(
                                        'Teacher: ${course.teacherNames?.join(', ') ?? 'N/A'}'),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
