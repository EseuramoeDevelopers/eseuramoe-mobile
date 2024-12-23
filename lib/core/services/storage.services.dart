import 'package:hive/hive.dart';

class StorageService {
  final String boxName;

  StorageService(this.boxName);

  Future<Box> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }

  Future<bool> save(String key, dynamic value) async {
    var box = await _openBox();
    await box.put(key, value);

    return true;
  }

  Future<dynamic> get(String key) async {
    var box = await _openBox();
    return box.get(key);
  }

  Future<void> delete(String key) async {
    var box = await _openBox();
    await box.delete(key);
  }
}