import 'package:cross_local_storage/cross_local_storage.dart';

class FilePickerHelper {
  late LocalStorageInterface _localStorage;

  Future<void> initData() async {
    _localStorage = await LocalStorage.getInstance();
  }

  Future<void> saveFile(String title, String data) async {
    await initData();
    _localStorage.setString(title, data);
  }

  Iterable<String> loadAllFiles() {
    return _localStorage.getKeys().where((String key) =>
        key != "lib_cached_image_data" && key != "lib_cached_image_data");
  }
}
