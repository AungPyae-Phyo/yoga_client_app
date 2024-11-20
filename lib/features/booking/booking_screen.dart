import 'package:flutter/material.dart';
import 'package:yoga_client_app/data/yoga_class.dart';
import 'package:yoga_client_app/data/booking_manager.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({Key? key}) : super(key: key);

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  List<Course> bookingList = [];

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    final bookings = BookingManager.getAllBookings();
    setState(() {
      bookingList = bookings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Bookings'),
        centerTitle: true,
      ),
      body: bookingList.isEmpty
          ? const Center(
              child: Text(
                'No bookings found.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: bookingList.length,
              itemBuilder: (context, index) {
                final course = bookingList[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      course.comment ?? 'No Title',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${course.dayOfWeek ?? 'N/A'}'),
                        Text('Teacher: ${course.teacherNames ?? 'N/A'}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        // await BookingManager.removeCourse(course.id.toString());
                        // fetchBookings();
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
