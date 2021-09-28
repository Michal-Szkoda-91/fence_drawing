import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'save_button_container.dart';
import '../providers/content_row_porviders.dart';
import '../models/save_file_helper.dart';
import 'saved_file_list.dart';

class SaveReadFileScreen extends StatelessWidget {

 const SaveReadFileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);
    var fileProvider = Provider.of<FilePickerHelper>(context);
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
                  future: fileProvider.initData(),
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
                          return Column(
                            children: [
                              SaveButtonContainer(),
                              Divider(
                                color: Theme.of(context).backgroundColor,
                                thickness: 3,
                              ),
                              Text(
                                'Moje ogrodzenia',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Expanded(
                                child: SavedFileList(),
                              ),
                              Divider(
                                color: Theme.of(context).backgroundColor,
                                thickness: 2,
                              ),
                              Material(
                                color: Theme.of(context).primaryColor,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5),
                                  splashColor:
                                      Theme.of(context).backgroundColor,
                                  hoverColor: Colors.black26,
                                  onTap: () {
                                    fileProvider.deleteAllFiles();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        'Wyczyść listę',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5)
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
