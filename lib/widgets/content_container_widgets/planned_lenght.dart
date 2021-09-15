import 'package:flutter/material.dart';

class PlannedLenght extends StatefulWidget {
  const PlannedLenght({
    Key? key,
  }) : super(key: key);

  @override
  State<PlannedLenght> createState() => _PlannedLenghtState();
}

class _PlannedLenghtState extends State<PlannedLenght> {
  late String _submittedValue;
  late int _numberToDivide;

  static final RegExp _numberRegExp = RegExp(r'^[0-9]+$');

  @override
  void initState() {
    super.initState();
    _submittedValue = '2000';
    _numberToDivide = 2000;
  }

  @override
  Widget build(BuildContext context) {
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
        // const SizedBox(width: 50),
        SizedBox(
          width: 140,
          height: 50,
          child: TextFormField(
            initialValue: _submittedValue,
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
                setState(() {
                  _submittedValue = val;
                  try {
                    _numberToDivide = int.parse(val);
                  } catch (e) {
                    // ignore: avoid_print
                    print(e);
                  }
                });
              } else {
                setState(() {
                  _submittedValue = _submittedValue;
                });
              }
            },
          ),
        ),
        Text(
          '  mm',
          style: Theme.of(context).textTheme.headline2,
        ),
        // const SizedBox(width: 50),
        SizedBox(
          width: 140,
          child: Text(
            '${(_numberToDivide / 1000)}',
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
