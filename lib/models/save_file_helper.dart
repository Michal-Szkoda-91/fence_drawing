import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:flutter/cupertino.dart';

class FilePickerHelper with ChangeNotifier {
  late LocalStorageInterface _localStorage;

  List<String> keyList = [];

  List<String> get getKeyList {
    return keyList;
  }

  void createKeyList() {
    keyList.clear();
    keyList = loadAllFiles().toList();
    notifyListeners();
  }

  Future<void> initData() async {
    _localStorage = await LocalStorage.getInstance();
  }

  void deleteAllFiles() {
    _localStorage.clear();
    createKeyList();
  }

  void deleteFile(String key) {
    _localStorage.remove(key);
    createKeyList();
  }

  Future<void> saveFile(String title, String data) async {
    _localStorage.setString(title, data);
    createKeyList();
  }

  String loadFile(String key) {
    return _localStorage.get(key);
  }

  Iterable<String> loadAllFiles() {
    return _localStorage.getKeys().where((String key) =>
        key != "lib_cached_image_data" && key != "lib_cached_image_data");
  }
}
