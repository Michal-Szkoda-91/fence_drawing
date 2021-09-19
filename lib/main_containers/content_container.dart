import 'package:flutter/material.dart';

import '../widgets/till_end_length.dart';
import '../widgets/planned_lenght.dart';
import '../widgets/actual_length.dart';
import '../widgets/reset_buttons.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 370,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: const [
          Expanded(flex: 1, child: SizedBox()),
          // SizedBox(height: 20),
          PlannedLenght(),
          // SizedBox(height: 20),
          Expanded(flex: 1, child: SizedBox()),
          TillEndLenght(),
          // SizedBox(height: 20),
          Expanded(flex: 1, child: SizedBox()),
          ActualLenght(),
          Expanded(flex: 4, child: ResetButtons()),
        ],
      ),
    );
  }
}
