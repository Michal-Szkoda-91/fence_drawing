import 'package:fence_drawing/widgets/actual_length.dart';
import 'package:flutter/material.dart';

import '../widgets/till_end_length.dart';
import '../widgets/planned_lenght.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 350,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: const [
          SizedBox(height: 20),
          PlannedLenght(),
          SizedBox(height: 20),
          TillEndLenght(),
          SizedBox(height: 20),
          ActualLenght(),
        ],
      ),
    );
  }
}
