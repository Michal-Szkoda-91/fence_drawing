import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/content_row_porviders.dart';

class ActualLenght extends StatefulWidget {
  const ActualLenght({
    Key? key,
  }) : super(key: key);

  @override
  State<ActualLenght> createState() => _ActualLenghtState();
}

class _ActualLenghtState extends State<ActualLenght> {
  @override
  Widget build(BuildContext context) {
    var dividedLength = Provider.of<DataProviders>(context).actualLenght;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            'Aktualna Długość Ogrodzenia',
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 140,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).backgroundColor,
              width: 3,
            ),
          ),
          child: Text(
            Provider.of<DataProviders>(context).actualLenght.toString(),
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '  mm',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          width: 120,
          child: Text(
            '${(dividedLength / 1000)}',
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
        Text(
          '  m',
          style: Theme.of(context).textTheme.headline2,
        ),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
