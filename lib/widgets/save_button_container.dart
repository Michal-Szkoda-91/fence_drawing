import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../models/save_file_helper.dart';
import '../models/element_model.dart';
import '../models/content_row_porviders.dart';

class SaveButtonContainer extends StatelessWidget {
  const SaveButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProviders>(context);
    final model = Provider.of<ElementModelProvider>(context);
    final fileProvider = Provider.of<FilePickerHelper>(context);
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              data.title,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          OutlinedButton.icon(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.black26,
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(10),
              ),
              textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).cardColor,
              ),
            ),
            label: const Text('Zapisz'),
            onPressed: () {
              model.createSaveFileText(
                  data.getTitle, data.plannedLenght, data.actualLenght);
              fileProvider.saveFile(
                  data.title,
                  model.createSaveFileText(
                      data.getTitle, data.plannedLenght, data.actualLenght));
              showDialog(
                barrierColor: Colors.black54,
                context: context,
                builder: (ctx) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 200,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        'Dodano plik do zapisanych',
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.save,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 6),
          OutlinedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.black26,
              ),
              side: MaterialStateProperty.all(
                BorderSide.none,
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(10),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              data.setsaveFileOpacity(false);
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.secondary,
              size: 32,
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}
