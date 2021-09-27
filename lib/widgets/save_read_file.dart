import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'save_button_container.dart';
import '../providers/content_row_porviders.dart';
import '../models/save_file_helper.dart';

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
  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);

    return Positioned(
      right: 60,
      top: 0,
      child: dataProviders.saveFileOpacity
          ? MouseRegion(
              onExit: (event) {
                dataProviders.setsaveFileOpacity(false);
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
                height: 600,
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
                              const SaveButtonContainer(),
                              Expanded(
                                child: Container(
                                  color: Colors.blue,
                                  child: ListView.builder(
                                      itemCount: _filePickerHelper
                                          .loadAllFiles()
                                          .length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            _keyList.elementAt(index),
                                          ),
                                        );
                                      }),
                                ),
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
