import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';

class SaveButtonContainer extends StatelessWidget {
  const SaveButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProviders>(context);
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
            onPressed: () {},
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
