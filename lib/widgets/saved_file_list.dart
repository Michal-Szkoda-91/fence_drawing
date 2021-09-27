import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/save_file_helper.dart';
import '../models/element_model.dart';

class SavedFileList extends StatelessWidget {
  SavedFileList({
    Key? key,
    required FilePickerHelper filePickerHelper,
    required Iterable<String> keyList,
  })  : _filePickerHelper = filePickerHelper,
        _keyList = keyList,
        super(key: key);

  final FilePickerHelper _filePickerHelper;
  final Iterable<String> _keyList;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var elementProvider = Provider.of<ElementModelProvider>(context);
    return RawScrollbar(
      isAlwaysShown: true,
      thumbColor: Theme.of(context).cardColor,
      thickness: 12,
      radius: const Radius.circular(5),
      controller: _controller,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 10),
        controller: _controller,
        shrinkWrap: true,
        itemCount: _filePickerHelper.loadAllFiles().length,
        itemBuilder: (context, index) {
          return Material(
            color: Theme.of(context).primaryColor,
            child: InkWell(
              splashColor: Theme.of(context).backgroundColor,
              hoverColor: Colors.black26,
              onTap: () {
                elementProvider.loadListFromPref(
                    _filePickerHelper.loadFile(_keyList.elementAt(index)));
              },
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        _keyList.elementAt(index),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
