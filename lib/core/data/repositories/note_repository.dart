import 'package:hive/hive.dart';
import '../../../features/study/domain/models/note.dart';

class NoteRepository {
  final Box<Note> _noteBox = Hive.box<Note>('notes');

  List<Note> getAllNotes() {
    return _noteBox.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> addNote(Note note) async {
    await _noteBox.add(note);
  }

  Future<void> deleteNote(int index) async {
    await _noteBox.deleteAt(index);
  }
}
