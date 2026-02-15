import 'package:hive/hive.dart';
import 'package:lecturio/features/vault/domain/models/vault_item.dart';

class VaultRepository {
  final Box<VaultItem> _vaultBox = Hive.box<VaultItem>('vault');

  List<VaultItem> getAllItems() {
    return _vaultBox.values.toList()..sort((a, b) => b.date.compareTo(a.date));
  }

  List<VaultItem> getItemsBySubject(String subjectId) {
    return _vaultBox.values
        .where((item) => item.subjectId == subjectId)
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> addItem(VaultItem item) async {
    await _vaultBox.add(item);
  }

  Future<void> deleteItem(int index) async {
    await _vaultBox.deleteAt(index);
  }
}
