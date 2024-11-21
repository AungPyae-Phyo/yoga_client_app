import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_client_app/data/yoga_class.dart';
import 'package:yoga_client_app/data/booking_manager.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

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

  Future<void> removeBooking(Course course) async {
    // Remove the booking from Hive database
    await BookingManager.removeBooking(course.id ?? "");
    // Update the booking list
    fetchBookings();
    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${course.comment ?? 'Booking'} Removed successfully!'),
      ),
    );
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
                        //  Text('User: ${extractEmailUsername(course.email)}'), // Display username
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Remove Booking'),
                            content: Text(
                              'Are you sure you want to remove "${course.comment ?? 'this booking'}"?',
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              CupertinoDialogAction(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await removeBooking(course);
                                },
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
