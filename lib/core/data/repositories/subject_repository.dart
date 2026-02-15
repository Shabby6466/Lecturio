import 'package:hive/hive.dart';
import '../../models/subject.dart';

class SubjectRepository {
  final Box<Subject> _subjectBox = Hive.box<Subject>('subjects');

  List<Subject> getAllSubjects() {
    return _subjectBox.values.toList();
  }

  Future<void> addSubject(Subject subject) async {
    await _subjectBox.put(subject.id, subject);
  }
}
