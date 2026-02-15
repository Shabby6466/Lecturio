import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 2)
class Note extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String subjectId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String content; // Raw text or bullet points

  @HiveField(4)
  final List<String> keyConcepts;

  @HiveField(5)
  final String quickReview;

  @HiveField(6)
  final DateTime createdAt;

  Note({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.content,
    required this.keyConcepts,
    required this.quickReview,
    required this.createdAt,
  });
}
