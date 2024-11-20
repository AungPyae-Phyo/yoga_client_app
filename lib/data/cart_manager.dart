import 'package:hive_flutter/adapters.dart';
import 'package:yoga_client_app/data/yoga_class.dart';

import '../../main.dart';


class CartManager {
  CartManager._();
  static List<Course> getAllCourse() {
    final box = Hive.box<Course>(yogaClassBoxName);
    return box.values.toList();
  }

  static Course? getCourse(int id) {
    final box = Hive.box<Course>(yogaClassBoxName);
    return box.get(id);
  }

  static Future<void> addCourse(Course yc) async {
    final box = Hive.box<Course>(yogaClassBoxName);
    return await box.put(yc.id, yc);
  }

  static Future<void> removeCourse(String id) async {
    final box = Hive.box<Course>(yogaClassBoxName);
    return await box.delete(id);
  }

  static Future<void> deleteAll(List<int> ids) async {
    final box = Hive.box<Course>(yogaClassBoxName);
    return await box.deleteAll(ids);
  }
}
