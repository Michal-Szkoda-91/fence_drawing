import 'package:fence_drawing/providers/content_row_porviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final String selectPosition;

  const CustomTextField({
    Key? key,
    required this.selectPosition,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  static final RegExp _numberRegExp = RegExp(r'^[0-9]+$');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: TextFormField(
        initialValue: Provider.of<DataProviders>(context).plannedLenght,
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
          errorStyle: Theme.of(context).textTheme.headline6,
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
            switch (widget.selectPosition) {
              case 'firstRow':
                Provider.of<DataProviders>(context, listen: false)
                    .setPlannedLenght(val);
                Provider.of<DataProviders>(context, listen: false)
                    .setPlannedDividedLenght(int.parse(val));
                break;
              default:
            }
          } else {
            switch (widget.selectPosition) {
              case 'firstRow':
                Provider.of<DataProviders>(context, listen: false)
                    .setPlannedLenght(
                  Provider.of<DataProviders>(context, listen: false)
                      .plannedLenght,
                );
                break;
              default:
            }
          }
        },
      ),
    );
  }
}
