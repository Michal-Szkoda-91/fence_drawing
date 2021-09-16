import 'package:fence_drawing/widgets/text_field_actual.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';
import 'text_field_planned.dart';

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
    var dividedLength =
        Provider.of<DataProviders>(context).actualLenghtDivadedLenght;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Aktualna Długość Ogrodzenia',
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const ActualLenghtTextField(),
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
