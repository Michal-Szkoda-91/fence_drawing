import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';
import 'text_field_tile_end.dart';

class TillEndLenght extends StatefulWidget {
  const TillEndLenght({
    Key? key,
  }) : super(key: key);

  @override
  State<TillEndLenght> createState() => _TillEndLenghtState();
}

class _TillEndLenghtState extends State<TillEndLenght> {
  @override
  Widget build(BuildContext context) {
    var dividedLength = 0;
    // Provider.of<DataProviders>(context).tillEndDividedLenght;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Długość do końca ogrodzenia',
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const TillEndLenghtTextField(),
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
