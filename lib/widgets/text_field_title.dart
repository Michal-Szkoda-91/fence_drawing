import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/content_row_porviders.dart';

class TextFormWithTitle extends StatelessWidget {
  const TextFormWithTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DataProviders>(context);
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      // initialValue: data.getTitle,
      style: Theme.of(context).textTheme.headline1,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        hintText: 'Wpisz tytuł...',
        hintStyle: TextStyle(color: Colors.grey.shade700),
        enabledBorder: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
      ),
      onChanged: (val) {
        data.setTitle(val);
      },
    );
  }
}
