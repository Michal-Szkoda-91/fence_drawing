import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'save_button_container.dart';
import '../providers/content_row_porviders.dart';
import '../models/save_file_helper.dart';
import 'saved_file_list.dart';

class SaveReadFileScreen extends StatefulWidget {
  const SaveReadFileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SaveReadFileScreen> createState() => _SaveReadFileScreenState();
}

class _SaveReadFileScreenState extends State<SaveReadFileScreen> {
  final FilePickerHelper _filePickerHelper = FilePickerHelper();
  late Iterable<String> _keyList;

  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);
    return Positioned(
      right: 20,
      top: 20,
      child: dataProviders.saveFileOpacity
          ? MouseRegion(
              onExit: (event) {
                // dataProviders.setsaveFileOpacity(false);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    color: Theme.of(context).backgroundColor,
                    width: 3,
                  ),
                ),
                width: 500,
                height: 500,
                child: FutureBuilder(
                  future: _filePickerHelper.initData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        if (snapshot.hasError) {
                          return const Text(
                              'Wystąpił błąd podczas wczytywania danych');
                        } else {
                          _keyList = _filePickerHelper.loadAllFiles();
                          return Column(
                            children: [
                              SaveButtonContainer(
                                  filePickerHelper: _filePickerHelper),
                              Divider(
                                color: Theme.of(context).backgroundColor,
                                thickness: 3,
                              ),
                              Expanded(
                                child: SavedFileList(
                                    filePickerHelper: _filePickerHelper,
                                    keyList: _keyList),
                              ),
                            ],
                          );
                        }
                    }
                  },
                ),
              ),
            )
          : const Center(),
    );
  }
}
