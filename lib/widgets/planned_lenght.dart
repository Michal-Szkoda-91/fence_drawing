import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';
import 'text_field_planned.dart';

class PlannedLenght extends StatefulWidget {
  const PlannedLenght({
    Key? key,
  }) : super(key: key);

  @override
  State<PlannedLenght> createState() => _PlannedLenghtState();
}

class _PlannedLenghtState extends State<PlannedLenght> {
  @override
  Widget build(BuildContext context) {
    var dividedLength =
        Provider.of<DataProviders>(context).plannedDividedLenght;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Planowana długość ogrodzenia',
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const PlannedLengthTextField(),
        Text(
          '  mm',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(width: 50),
        SizedBox(
          width: 140,
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
        const SizedBox(width: 50),
      ],
    );
  }
}
