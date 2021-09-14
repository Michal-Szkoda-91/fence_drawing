import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlannedLenght extends StatefulWidget {
  const PlannedLenght({
    Key? key,
  }) : super(key: key);

  @override
  State<PlannedLenght> createState() => _PlannedLenghtState();
}

class _PlannedLenghtState extends State<PlannedLenght> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = '2000';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Planowana długość ogrodzenia',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(width: 50),
        Card(
          child: SizedBox(
            width: 120,
            height: 50,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _controller,
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
                    color: Theme.of(context).colorScheme.secondary,
                    width: 3,
                  ),
                ),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (val) {
                setState(() {
                  _controller.text = val;
                });
              },
            ),
          ),
        ),
        Text(
          '  mm',
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(width: 50),
        SizedBox(
          width: 140,
          child: Text(
            '${(int.parse(_controller.text) / 1000)}',
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
      ],
    );
  }
}
