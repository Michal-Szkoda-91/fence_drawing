import 'package:flutter/material.dart';

class TillEndLenghtTextField extends StatefulWidget {
  const TillEndLenghtTextField({Key? key}) : super(key: key);

  @override
  State<TillEndLenghtTextField> createState() => _TillEndLenghtTextFieldState();
}

class _TillEndLenghtTextFieldState extends State<TillEndLenghtTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: TextFormField(
        // ma byc roznica dlugosci
        readOnly: true,
        initialValue: '0',
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
