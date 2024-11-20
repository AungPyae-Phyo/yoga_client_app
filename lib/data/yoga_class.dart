import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoga_client_app/config/features/course_detail/course_info.dart';

part 'yoga_class.g.dart';

@HiveType(typeId: 0)
class YogaClass {
  @HiveField(0)
  final num? capacity;
  @HiveField(1)
  final List<Course>? classes;
  @HiveField(2)
  final String? dayOfWeek;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? difficultyLevel;
  @HiveField(5)
  final String? displayPrice;
  @HiveField(6)
  final String? duration;
  @HiveField(7)
  final String? eventType;
  @HiveField(8)
  final String? id;
  @HiveField(9)
  final num? latitude;
  @HiveField(10)
  final num? longitude;
  @HiveField(11)
  final String? onlineUrl;
  @HiveField(12)
  final num? pricePerClass;
  @HiveField(13)
  final String? time;
  @HiveField(14)
  final String? typeOfClass;

  YogaClass({
    this.capacity,
    this.classes,
    this.dayOfWeek,
    this.description,
    this.difficultyLevel,
    this.displayPrice,
    this.duration,
    this.eventType,
    this.id,
    this.latitude,
    this.longitude,
    this.onlineUrl,
    this.pricePerClass,
    this.time,
    this.typeOfClass,
  });

  /// Factory constructor to create an instance from a map (JSON).
  factory YogaClass.fromMap(Map<String, dynamic> map) {
    return YogaClass(
      capacity: map['capacity'] ?? 0,
      classes: (map['classes'] as List<dynamic>?)
          ?.map((e) => Course.fromMap(e))
          .toList(),
      dayOfWeek: map['dayOfWeek'] ?? '',
      description: map['description'] ?? '',
      difficultyLevel: map['difficultyLevel'] ?? '',
      displayPrice: map['displayPrice'] ?? '',
      duration: map['duration'] ?? '',
      eventType: map['eventType'] ?? '',
      id: map['id'] ?? '',
      latitude: (map['latitude'] ?? 0).toDouble(),
      longitude: (map['longitude'] ?? 0).toDouble(),
      onlineUrl: map['onlineUrl'] ?? '',
      pricePerClass: map['pricePerClass'] ?? 0,
      time: map['time'] ?? '',
      typeOfClass: map['typeOfClass'] ?? '',
    );
  }

  /// Method to create a copy of the current instance with optional modifications.
  YogaClass copyWith({
    num? capacity,
    List<Course>? classes,
    String? dayOfWeek,
    String? description,
    String? difficultyLevel,
    String? displayPrice,
    String? duration,
    String? eventType,
    String? id,
    num? latitude,
    num? longitude,
    String? onlineUrl,
    num? pricePerClass,
    String? time,
    String? typeOfClass,
  }) {
    return YogaClass(
      capacity: capacity ?? this.capacity,
      classes: classes ?? this.classes,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      description: description ?? this.description,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      displayPrice: displayPrice ?? this.displayPrice,
      duration: duration ?? this.duration,
      eventType: eventType ?? this.eventType,
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      onlineUrl: onlineUrl ?? this.onlineUrl,
      pricePerClass: pricePerClass ?? this.pricePerClass,
      time: time ?? this.time,
      typeOfClass: typeOfClass ?? this.typeOfClass,
    );
  }

  /// Method to convert the instance back to a map.
  Map<String, dynamic> toMap() {
    return {
      'capacity': capacity,
      'classes': classes,
      'dayOfWeek': dayOfWeek,
      'description': description,
      'difficultyLevel': difficultyLevel,
      'displayPrice': displayPrice,
      'duration': duration,
      'eventType': eventType,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'onlineUrl': onlineUrl,
      'pricePerClass': pricePerClass,
      'time': time,
      'typeOfClass': typeOfClass,
    };
  }
}

@HiveType(typeId: 1)
class Course {
  @HiveField(0)
  final String? comment;
  @HiveField(1)
  final String? courseId;
  @HiveField(2)
  final String? date;
  @HiveField(3)
  final String? dayOfWeek;
  @HiveField(4)
  final String? id;
  @HiveField(5)
  final List<String>? teacherNames;

  Course({
    this.comment,
    this.courseId,
    this.date,
    this.dayOfWeek,
    this.id,
    this.teacherNames,
  });

  // fromMap constructor
  factory Course.fromMap(Map<String, dynamic> map) {
    print(map['teachers']);
    print(map['teachers'][0].runtimeType);

    return Course(
      comment: map['comment'] as String?,
      courseId: map['courseId'] as String?,
      date: map['date'] as String?,
      dayOfWeek: map['dayOfWeek'] as String?,
      id: map['id'] as String?,
      teacherNames: (map['teachers'] as List<dynamic>?)?.map((e)=> e.toString()).toList(),
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'courseId': courseId,
      'date': date,
      'dayOfWeek': dayOfWeek,
      'id': id,
      'teacherNames': teacherNames,
    };
  }

  // copyWith method
  Course copyWith({
    String? comment,
    String? courseId,
    String? date,
    String? dayOfWeek,
    String? id,
    List<String>? teacherNames,
  }) {
    return Course(
      comment: comment ?? this.comment,
      courseId: courseId ?? this.courseId,
      date: date ?? this.date,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      id: id ?? this.id,
      teacherNames: teacherNames ?? this.teacherNames,
    );
  }

  @override
  String toString() {
    return 'Course(comment: $comment, courseId: $courseId, date: $date, dayOfWeek: $dayOfWeek, id: $id, teacherNames: $teacherNames)';
  }
}
