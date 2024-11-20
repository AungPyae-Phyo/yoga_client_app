import 'package:hive_flutter/adapters.dart';
import '../data/yoga_class.dart';
import '../main.dart';

class BookingManager {
  BookingManager._();

  static List<Course> getAllBookings() {
    final box =
        Hive.box<Course>('course_booking'); // Use a new box for bookings
    return box.values.toList();
  }

  static Course? getBooking(int id) {
    final box = Hive.box<Course>('course_booking');
    return box.get(id);
  }

  static Future<void> addBooking(Course yc) async {
    final box = Hive.box<Course>('course_booking');
    return await box.put(yc.id, yc);
  }

  static Future<void> removeBooking(String id) async {
    final box = Hive.box<Course>('course_booking');
    return await box.delete(id);
  }

  static Future<int> clearAllBookings() async {
    final box = Hive.box<Course>('course_booking');
    return await box.clear();
  }
}
