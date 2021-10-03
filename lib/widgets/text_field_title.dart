import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/content_row_porviders.dart';

class TextFormWithTitle extends StatelessWidget {
  TextFormWithTitle({
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DataProviders>(context);
    textEditingController.text = data.getTitle;
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: Theme.of(context).textTheme.headline1,
      textAlign: TextAlign.center,
      controller: textEditingController,
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
