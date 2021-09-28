import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/save_file_helper.dart';
import '../models/element_model.dart';

class SavedFileList extends StatelessWidget {
  SavedFileList({
    Key? key,
  }) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var elementProvider = Provider.of<ElementModelProvider>(context);
    var fileProvider = Provider.of<FilePickerHelper>(context);
    return fileProvider.getKeyList.isEmpty
        ? const Center()
        : RawScrollbar(
            isAlwaysShown: true,
            thumbColor: Theme.of(context).cardColor,
            thickness: 12,
            radius: const Radius.circular(5),
            controller: _controller,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 10),
              controller: _controller,
              shrinkWrap: true,
              itemCount: fileProvider.loadAllFiles().length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Material(
                          color: Theme.of(context).primaryColor,
                          child: InkWell(
                            splashColor: Theme.of(context).backgroundColor,
                            hoverColor: Colors.black26,
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {
                              elementProvider.loadListFromPref(
                                  fileProvider.loadFile(
                                      fileProvider.keyList.elementAt(index)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                fileProvider.keyList.elementAt(index),
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5),
                          splashColor: Theme.of(context).backgroundColor,
                          hoverColor: Colors.black26,
                          onTap: () {
                            fileProvider.deleteFile(
                                fileProvider.keyList.elementAt(index));
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }
}
