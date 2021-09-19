import 'package:fence_drawing/providers/content_row_porviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/element_model.dart';

class ResetButtons extends StatelessWidget {
  const ResetButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataElement = Provider.of<ElementModelProvider>(context);
    var dataLenght = Provider.of<DataProviders>(context);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
              label: const Text('Wyczyść'),
              onPressed: () {
                if (dataElement.createdElementListget.isNotEmpty) {
                  dataElement.clearCreatedList();
                  dataLenght.clearActualLength();
                }
              },
              icon: Icon(
                Icons.cleaning_services_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 30),
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
              label: const Text('Cofnij'),
              onPressed: () {
                if (dataElement.createdElementListget.isNotEmpty) {
                  dataLenght.substringLastElementLenght(
                    dataElement
                        .createdElementListget[
                            dataElement.createdElementListget.length - 1]
                        .lenght,
                  );
                  dataElement.removeLastElement();
                }
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
