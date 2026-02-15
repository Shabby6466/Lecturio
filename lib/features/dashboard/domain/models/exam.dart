import 'package:hive/hive.dart';

part 'exam.g.dart';

@HiveType(typeId: 1)
class Exam extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String subjectId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String notificationFrequency; // 'Daily', 'Weekly'

  Exam({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.date,
    required this.notificationFrequency,
  });

  int get daysUntil => date.difference(DateTime.now()).inDays;
}
