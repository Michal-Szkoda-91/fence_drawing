import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/element_model.dart';

class SliderMagnifier extends StatefulWidget {
  const SliderMagnifier({Key? key}) : super(key: key);

  @override
  _SliderMagnifierState createState() => _SliderMagnifierState();
}

class _SliderMagnifierState extends State<SliderMagnifier> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ElementModelProvider>(context);
    return Row(
      children: [
        Slider(
          value: data.getSliderSensitive,
          activeColor: Theme.of(context).colorScheme.secondary,
          label: 'Przybliżenie',
          min: 0,
          max: 6,
          divisions: 6,
          onChanged: (double val) {
            data.setSliderSensitive(val.toInt());
          },
        ),
        Text(
          "Zoom x ${data.getDivider}",
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
