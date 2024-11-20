// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YogaClassAdapter extends TypeAdapter<YogaClass> {
  @override
  final int typeId = 0;

  @override
  YogaClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YogaClass(
      capacity: fields[0] as num?,
      classes: (fields[1] as List?)?.cast<Course>(),
      dayOfWeek: fields[2] as String?,
      description: fields[3] as String?,
      difficultyLevel: fields[4] as String?,
      displayPrice: fields[5] as String?,
      duration: fields[6] as String?,
      eventType: fields[7] as String?,
      id: fields[8] as String?,
      latitude: fields[9] as num?,
      longitude: fields[10] as num?,
      onlineUrl: fields[11] as String?,
      pricePerClass: fields[12] as num?,
      time: fields[13] as String?,
      typeOfClass: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, YogaClass obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.capacity)
      ..writeByte(1)
      ..write(obj.classes)
      ..writeByte(2)
      ..write(obj.dayOfWeek)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.difficultyLevel)
      ..writeByte(5)
      ..write(obj.displayPrice)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.eventType)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.latitude)
      ..writeByte(10)
      ..write(obj.longitude)
      ..writeByte(11)
      ..write(obj.onlineUrl)
      ..writeByte(12)
      ..write(obj.pricePerClass)
      ..writeByte(13)
      ..write(obj.time)
      ..writeByte(14)
      ..write(obj.typeOfClass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YogaClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 1;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course(
      comment: fields[0] as String?,
      courseId: fields[1] as String?,
      date: fields[2] as String?,
      dayOfWeek: fields[3] as String?,
      id: fields[4] as String?,
      teacherNames: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.comment)
      ..writeByte(1)
      ..write(obj.courseId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.dayOfWeek)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.teacherNames);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
