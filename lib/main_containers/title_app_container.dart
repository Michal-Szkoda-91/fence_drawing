import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';

class TitleAppContainer extends StatelessWidget {
  const TitleAppContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DataProviders>(context);
    return Container(
      width: double.infinity,
      height: 80,
      color: Theme.of(context).primaryColor,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        // initialValue: data.getTitle,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,

        decoration: InputDecoration(
          hintText: 'Wpisz tytuł...',
          hintStyle: TextStyle(color: Colors.grey.shade700),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 2,
            ),
          ),
        ),
        onChanged: (val) {
          data.setTitle(val);
        },
      ),
    );
  }
}
