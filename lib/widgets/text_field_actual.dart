import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';

class ActualLenghtTextField extends StatefulWidget {
  const ActualLenghtTextField({Key? key}) : super(key: key);

  @override
  State<ActualLenghtTextField> createState() => _ActualLenghtTextFieldState();
}

class _ActualLenghtTextFieldState extends State<ActualLenghtTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: TextFormField(
        // ma byc roznica dlugosci
        readOnly: true,
        initialValue: Provider.of<DataProviders>(context).actualLenght,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(fontWeight: FontWeight.w600),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          isDense: true,
          //Genereal settings
          fillColor: Theme.of(context).cardColor,
          filled: true,
          //specific settings
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
