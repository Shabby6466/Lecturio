import 'package:hive/hive.dart';

part 'vault_item.g.dart';

@HiveType(typeId: 3)
class VaultItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String subjectId;

  @HiveField(2)
  final String fileName;

  @HiveField(3)
  final String filePath;

  @HiveField(4)
  final String type; // 'PDF', 'Photo'

  @HiveField(5)
  final DateTime date;

  @HiveField(6)
  final int lectureNumber;

  @HiveField(7)
  final String topic;

  VaultItem({
    required this.id,
    required this.subjectId,
    required this.fileName,
    required this.filePath,
    required this.type,
    required this.date,
    required this.lectureNumber,
    required this.topic,
  });
}
