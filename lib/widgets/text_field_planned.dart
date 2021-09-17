import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';

class PlannedLengthTextField extends StatefulWidget {
  const PlannedLengthTextField({Key? key}) : super(key: key);

  @override
  State<PlannedLengthTextField> createState() => _PlannedLengthTextFieldState();
}

class _PlannedLengthTextFieldState extends State<PlannedLengthTextField> {
  static final RegExp _numberRegExp = RegExp(r'^[0-9]+$');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: TextFormField(
        initialValue:
            Provider.of<DataProviders>(context).plannedLenght.toString(),
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
          errorStyle: Theme.of(context).textTheme.headline3,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 3,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 3,
            ),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Uzupłnij dane';
          } else if (_numberRegExp.hasMatch(value)) {
            return null;
          } else {
            return 'Tylko cyfry!';
          }
        },
        onChanged: (val) {
          if (_numberRegExp.hasMatch(val)) {
            Provider.of<DataProviders>(context, listen: false)
                .setPlannedLenght(int.parse(val));
          } else {
            Provider.of<DataProviders>(context, listen: false).setPlannedLenght(
              Provider.of<DataProviders>(context, listen: false).plannedLenght,
            );
          }
        },
      ),
    );
  }
}
